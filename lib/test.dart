import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:image_picker/image_picker.dart';





class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  bool _isLogin = true;

  void _submitAuthForm() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();

    try {
      if (_isLogin) {
        await _auth.signInWithEmailAndPassword(
          email: _email,
          password: _password,
        );
      } else {
        await _auth.createUserWithEmailAndPassword(
          email: _email,
          password: _password,
        );
      }
    } catch (error) {
      print(error);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isLogin ? 'Login' : 'Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                key: ValueKey('email'),
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || !value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value!;
                },
              ),
              TextFormField(
                key: ValueKey('password'),
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
                onSaved: (value) {
                  _password = value!;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitAuthForm,
                child: Text(_isLogin ? 'Login' : 'Register'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _isLogin = !_isLogin;
                  });
                },
                child: Text(
                  _isLogin ? 'Don\'t have an account? Register' : 'Already have an account? Login',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;
  final _picker = ImagePicker();
  User? _user;
  String _name = '';
  String _profilePicUrl = '';

  @override
  void initState() {
    super.initState();
    _user = _auth.currentUser;
    if (_user != null) {
      _firestore.collection('users').doc(_user!.uid).get().then((doc) {
        setState(() {
          _name = doc['name'];
          _profilePicUrl = doc['profilePic'];
        });
      });
    }
  }

  Future<void> _pickProfilePicture() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final storageRef = _storage.ref().child('profile_pics').child('${_user!.uid}.jpg');
      await storageRef.putFile(File(pickedFile.path));
      final url = await storageRef.getDownloadURL();
      setState(() {
        _profilePicUrl = url;
      });
      await _firestore.collection('users').doc(_user!.uid).update({
        'profilePic': _profilePicUrl,
      });
    }
  }

  void _updateName(String value) {
    _name = value;
    _firestore.collection('users').doc(_user!.uid).update({
      'name': _name,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (_profilePicUrl.isNotEmpty)
              CircleAvatar(
                backgroundImage: NetworkImage(_profilePicUrl),
                radius: 50,
              ),
            if (_profilePicUrl.isEmpty)
              CircleAvatar(
                child: Icon(Icons.person, size: 50),
                radius: 50,
              ),
            TextButton(
              onPressed: _pickProfilePicture,
              child: Text('Change Profile Picture'),
            ),
            TextFormField(
              initialValue: _name,
              decoration: InputDecoration(labelText: 'Name'),
              onChanged: _updateName,
            ),
          ],
        ),
      ),
    );
  }
}


class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('messages')
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                final docs = snapshot.data!.docs;
                return ListView.builder(
                  reverse: true,
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    return ChatMessageBubble(
                      docs[index]['text'],
                      docs[index]['senderName'],
                      docs[index]['senderProfilePic'],
                    );
                  },
                );
              },
            ),
          ),
          NewMessageInput(),
        ],
      ),
    );
  }
}

class ChatMessageBubble extends StatelessWidget {
  final String text;
  final String senderName;
  final String senderProfilePic;

  ChatMessageBubble(this.text, this.senderName, this.senderProfilePic);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: CachedNetworkImageProvider(senderProfilePic),
      ),
      title: Text(senderName),
      subtitle: Text(text),
    );
  }
}

class NewMessageInput extends StatefulWidget {
  @override
  _NewMessageInputState createState() => _NewMessageInputState();
}

class _NewMessageInputState extends State<NewMessageInput> {
  final _textController = TextEditingController();

  void _sendMessage() async {
    final text = _textController.text.trim();
    if (text.isEmpty) {
      return;
    }

    final user = FirebaseAuth.instance.currentUser;
    final userDoc = await FirebaseFirestore.instance.collection('users').doc(user!.uid).get();
    final senderName = userDoc['name'];
    final senderProfilePic = userDoc['profilePic'];

    FirebaseFirestore.instance.collection('messages').add({
      'text': text,
      'senderName': senderName,
      'senderProfilePic': senderProfilePic,
      'timestamp': FieldValue.serverTimestamp(),
    });

    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(labelText: 'Type a message'),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: _sendMessage,
          ),
        ],
      ),
    );
  }
}


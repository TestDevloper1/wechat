import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wechat/screens/chat_screen.dart';
import '../model/meme_model.dart';
import '../serivices/api.dart';
import '../widgets/divider_widget.dart';

class StoryScreen extends StatefulWidget {
  const StoryScreen({super.key});

  @override
  _StoryScreenState createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  List<Meme> chat = [];

  @override
  void initState() {
    super.initState();
    fetchMemes();
  }

  Future<void> fetchMemes() async {
    try {
      MemesService api = MemesService();
      List<Meme> fetchedMemes = await api.fetchMemes();
      setState(() {
        chat = fetchedMemes;
      });
    } catch (error) {
      print('Failed to fetch chat: $error');
      // Handle error gracefully
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12, left: 12),
      child: Container(
        height: 80,
        decoration: const BoxDecoration(),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
          itemCount: chat.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final meme = chat[index];
            return InkWell(
              onTap: () {
                print('story');
              },
              child: Column(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      image: DecorationImage(
                        image: NetworkImage('https://twilsms.com/meme_admin/${meme.thumbnail}'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  const Expanded(child: Text('Name', maxLines: 1)),

                ],
              ),
            );
          },
        ),
      ),
    );
  }
}




class ChatProfileScreen extends StatefulWidget {
  const ChatProfileScreen({super.key});

  @override
  _ChatProfileScreenState createState() => _ChatProfileScreenState();
}

class _ChatProfileScreenState extends State<ChatProfileScreen> {
  List<Meme> chat = [];

  @override
  void initState() {
    super.initState();
    fetchMemes();
  }

  Future<void> fetchMemes() async {
    try {
      MemesService api = MemesService();
      List<Meme> fetchedMemes = await api.fetchMemes();

      setState(() {
        chat = fetchedMemes;
      });
    } catch (error) {
      print('Failed to fetch chat: $error');
    }
  }
  //'https://twilsms.com/meme_admin/${meme.thumbnail}'
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 0, left: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          DividerWidget.divider(),

          Container(
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              // borderRadius: BorderRadius.circular(50),
              // color: Colors.red
            ),
            child: ListView.builder(
              itemCount: chat.length,
              // itemCount: 8,
              scrollDirection: Axis.vertical,

              itemBuilder: (context, index) {
                final meme = chat[index];
                return ListTile(
                  onTap: () {
                    Get.to( ChatScreen(profile: meme.thumbnail, name: meme.description,));
                  },
                  title: Row(
                    children: [
                      Expanded(child: Text(meme.description, maxLines: 1)),
                      SizedWidget.size(0, 10),
                      Text('4:45', maxLines: 1,style: TextStyle(fontSize: 13, color: Colors.blue.shade900)),
                    ],
                  ),
                  subtitle: const Text('Last message'),
                  leading: Container(
                    width: 55,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.grey.shade100,
                      image: DecorationImage(
                        image: NetworkImage('https://twilsms.com/meme_admin/${meme.thumbnail}'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
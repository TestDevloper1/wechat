import 'package:flutter/material.dart';

import '../widgets/divider_widget.dart';

class ChatScreen extends StatefulWidget {
  final String profile;
  final String name;

  const ChatScreen({Key? key, required this.profile,required this.name}) : super(key: key);


  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        actions: [
          CircleAvatar(maxRadius: 25,foregroundImage: NetworkImage('https://twilsms.com/meme_admin/${widget.profile}')),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: ListTile(
            title: Text(widget.name, maxLines: 1),
            subtitle: const Text('Online', style: TextStyle(color: Colors.green)),
          ),
        ),
          SizedWidget.size(0, 5),
          const Icon(Icons.video_camera_front,color: Colors.blue),
          SizedWidget.size(0, 15),
          const Icon(Icons.call,color: Colors.blue),
          SizedWidget.size(0, 15),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        // color: Colors.red,
        child: Column(
          children: [
            SizedWidget.size(20, 0),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  CircleAvatar(maxRadius: 10,foregroundImage: NetworkImage('https://twilsms.com/meme_admin/${widget.profile}')),
                  SizedWidget.size(0, 10),
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.6, // Limit width to 60% of screen width
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(12),
                      child: Text(
                            '''hi''',
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),


            SizedWidget.size(20, 0),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(12),
                      child: Text('''hello'''),
                    ),
                  ),
                ),
              ],
            ),

            SizedWidget.size(20, 0),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(12),
                      child: Text('''What is your  name'''),
                    ),
                  ),
                ),
              ],
            ),

            SizedWidget.size(20, 0),

            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(maxRadius: 10,foregroundImage: NetworkImage('https://twilsms.com/meme_admin/${widget.profile}')),
                  SizedWidget.size(0, 10),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(12),
                      child: Text('My name is Ajay'),
                    ),
                  ),
                ],
              ),
            ),

            SizedWidget.size(20, 0),

            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(maxRadius: 10,foregroundImage: NetworkImage('https://twilsms.com/meme_admin/${widget.profile}')),
                  SizedWidget.size(0, 10),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(12),
                      child: Text('What is your good name'),
                    ),
                  ),
                ],
              ),
            ),

            SizedWidget.size(20, 0),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(12),
                      child: Text('''I am Amit'''),
                    ),
                  ),
                ),
              ],
            ),

            SizedWidget.size(20, 0),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(12),
                      child: Text('Where are you from'),
                    ),
                  ),
                ),
              ],
            ),

            SizedWidget.size(20, 0),

            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(maxRadius: 10,foregroundImage: NetworkImage('https://twilsms.com/meme_admin/${widget.profile}')),
                  SizedWidget.size(0, 10),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(12),
                      child: Text('''Rishikesh'''),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}

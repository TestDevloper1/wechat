import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widgets/appbar_widget.dart';
import '../widgets/chat_widget.dart';
import '../widgets/search_widget.dart';

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

      appBar: AppBarWidget.appbarButton(context, widget.profile, widget.name),

      body: Column(
        children: [

          ChatWidget.chat(context, widget.profile),

          const Spacer(),

          TextFieldWidget.chatBar(),

        ],
      ),
    );
  }
}


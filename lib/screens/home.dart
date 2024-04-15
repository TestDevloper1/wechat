import 'package:flutter/material.dart';

import '../model/meme_model.dart';
import '../widgets/chat_profile_widget.dart';
import '../widgets/search_widget.dart';
import '../widgets/story_widget.dart';
import '../widgets/divider_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      // physics: const NeverScrollableScrollPhysics(),
      children: [
        SizedWidget.size(10, 0),

        SearchWidget.searchBar(),

        SizedWidget.size(10, 0),

        StoryWidget.story(),

        SizedWidget.size(10, 0),

        ChatProfileWidget.chat(),

      ],
    );
  }
}


import 'package:flutter/material.dart';

class SearchWidget {
  static SearchBar searchBar() {
    TextEditingController textController = TextEditingController();
    return SearchBar(
      hintText: 'Search your chat',
      controller: textController,
      onSubmitted: (value) {
        print(textController);
      },
    );
  }
}
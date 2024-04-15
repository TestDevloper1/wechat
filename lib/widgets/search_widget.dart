
import 'package:flutter/material.dart';
import 'package:wechat/widgets/toast_widget.dart';

import '../helper/color_helper.dart';

class SearchWidget {
  static Padding searchBar() {
    final TextEditingController textController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
      child: SearchBar(
        hintText: 'Search your chat',
        controller: textController,
        onSubmitted: (value) {
          ToastWidget.showToast('message');
          // print(textController);
        },
      ),
    );
  }
}




class TextFieldWidget {
  static Padding chatBar() {
    final TextEditingController textController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 0,),
      child: TextField(

        controller: textController,
        textInputAction: TextInputAction.search,

        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          hintText: "Message",
          prefixIcon: IconButton(
            onPressed: () {
              ToastWidget.showToast('We are working on emoji');
            },
            icon: const Icon(Icons.emoji_emotions_rounded,)
          ),
          suffixIcon: const Icon(Icons.send_sharp),
          filled: true,

        ),
      ),
    );
  }
}



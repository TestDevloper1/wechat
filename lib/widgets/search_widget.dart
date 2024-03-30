
import 'package:flutter/material.dart';
import 'package:wechat/widgets/toast_widget.dart';

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




class ButtonWidget {
  static InkWell button() {
    // final TextEditingController textController = TextEditingController();
    return InkWell(
      onTap: () {
        ToastWidget.showToast('message');
      },
      child: Container(
        // color: Colors.red,
        height: 50,
        width: 50,
        child: const Center(child: Text('Button')),
      ),
    );
  }
}



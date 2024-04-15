import 'package:flutter/material.dart';

import 'divider_widget.dart';

class AppBarWidget {
  static AppBar appbar() {
    return AppBar(
      title: Text(AppName.appName),
    );
  }

  static AppBar appbarButton(BuildContext context, String profile, String name) {
    return AppBar(
      toolbarHeight: 70,
      actions: [
        CircleAvatar(maxRadius: 25,foregroundImage: NetworkImage('https://twilsms.com/meme_admin/$profile')),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: ListTile(
            title: Text(name, maxLines: 1),
            subtitle: const Text('Online', style: TextStyle(color: Colors.green)),
          ),
        ),
        SizedWidget.size(0, 5),
        const Icon(Icons.video_camera_front,color: Colors.blue),
        SizedWidget.size(0, 15),
        const Icon(Icons.call,color: Colors.blue),
        SizedWidget.size(0, 15),
      ],
    );
  }
}


class AppName {
  static String get appName => "Chat App";
}
import 'package:flutter/material.dart';

class AppBarWidget {
  static String get appName => "All Video Downloader";

  static AppBar appbar() {
    return AppBar(
      title: Text(AppName.appName),
    );
  }
}


class AppName {
  static String get appName => "Chat App";
}
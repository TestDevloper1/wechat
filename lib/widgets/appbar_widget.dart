import 'package:flutter/material.dart';

class AppBarWidget {
  static String get appName => "Chat App";

  static AppBar appbar() {
    return AppBar(
      title: Text(AppName.appName),
    );
  }
}


class AppName {
  static String get appName => "Chat App";
}
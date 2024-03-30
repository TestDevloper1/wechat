import 'dart:ffi';

import 'package:flutter/material.dart';

class DividerWidget {
  static Padding divider() {
    return const Padding(
      padding: EdgeInsets.only(right: 12, left: 12),
      child: Divider(color: Colors.black),
    );
  }
}

class SizedWidget {
  static SizedBox size(int h, int w) {
    return SizedBox(
      height: h.toDouble(),
      width: w.toDouble(),
    );
  }
}
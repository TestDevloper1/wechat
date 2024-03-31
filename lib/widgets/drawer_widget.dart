

import 'package:flutter/material.dart';
import '../helper/color_helper.dart';
import 'appbar_widget.dart';

class DrawerWidget {
  static Drawer drawer(BuildContext context, VoidCallback onThemeChange) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.7,
      child: ListView(
        children: [
          Container(
            height: 130,
            decoration: const BoxDecoration(
              color: AppColor.primary2,
            ),
            child: Center(child: Text(AppName.appName, style: const TextStyle(fontSize: 20),)),
          ),
          TextButton(
            onPressed: () {
              onThemeChange();
            },
            child: Row(
              children: [
                Icon(Theme.of(context).brightness == Brightness.light ? Icons.nightlight_round : Icons.sunny),
                const SizedBox(width: 20,),
                Text(Theme.of(context).brightness == Brightness.light ? 'Dark Mode' : 'Light Mode'),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              // Get.back();
            },
            child: const Row(
              children: [
                Icon(Icons.home),
                SizedBox(width: 20),
                Text('Home'),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              // Get.back();
            },
            child: const Row(
              children: [
                Icon(Icons.download_rounded),
                SizedBox(width: 20),
                Text('Downloads'),
              ],
            ),
          ),
          TextButton(
            onPressed: () {

            },
            child: const Row(
              children: [
                Icon(Icons.star),
                SizedBox(width: 20),
                Text('Rate us'),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              // Get.back();
            },
            child: const Row(
              children: [
                Icon(Icons.share),
                SizedBox(width: 20),
                Text('Refer to friend'),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              // Get.back();
            },
            child: const Row(
              children: [
                Icon(Icons.help_outline_rounded),
                SizedBox(width: 20),
                Text('Help & Support'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../helper/color_helper.dart';
import 'divider_widget.dart';

class ChatWidget {
  static SizedBox chat(BuildContext context, String profile,) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.8,
      // color: Colors.red,
      child: ListView(
        children: [

          SizedWidget.size(20, 0),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(maxRadius: 10,foregroundImage: NetworkImage('https://twilsms.com/meme_admin/$profile')),
                SizedWidget.size(0, 10),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.6,
                  ),
                  decoration: BoxDecoration(
                    color: AppColor.receiveMessage,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      '''hi''',
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedWidget.size(20, 0),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColor.sendMessage,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(12),
                    child: Text('''hello'''),
                  ),
                ),
              ),
            ],
          ),

          SizedWidget.size(20, 0),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColor.sendMessage,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(12),
                    child: Text('''What is your  name'''),
                  ),
                ),
              ),
            ],
          ),

          SizedWidget.size(20, 0),

          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(maxRadius: 10,foregroundImage: NetworkImage('https://twilsms.com/meme_admin/$profile')),
                SizedWidget.size(0, 10),
                Container(
                  decoration: BoxDecoration(
                      color: AppColor.receiveMessage,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(12),
                    child: Text('My name is Ajay'),
                  ),
                ),
              ],
            ),
          ),

          SizedWidget.size(20, 0),

          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(maxRadius: 10,foregroundImage: NetworkImage('https://twilsms.com/meme_admin/$profile')),
                SizedWidget.size(0, 10),
                Container(
                  decoration: BoxDecoration(
                      color: AppColor.receiveMessage,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(12),
                    child: Text('What is your good name'),
                  ),
                ),
              ],
            ),
          ),

          SizedWidget.size(20, 0),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColor.sendMessage,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(12),
                    child: Text('''I am Amit'''),
                  ),
                ),
              ),
            ],
          ),

          SizedWidget.size(20, 0),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColor.sendMessage,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(12),
                    child: Text('Where are you from'),
                  ),
                ),
              ),
            ],
          ),

          SizedWidget.size(20, 0),

          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(maxRadius: 10,foregroundImage: NetworkImage('https://twilsms.com/meme_admin/$profile')),
                SizedWidget.size(0, 10),
                Container(
                  decoration: BoxDecoration(
                      color: AppColor.receiveMessage,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(12),
                    child: Text('''Rishikesh'''),
                  ),
                ),
              ],
            ),
          ),

          SizedWidget.size(20, 0),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColor.sendMessage,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(12),
                    child: Text('''I am Amit'''),
                  ),
                ),
              ),
            ],
          ),

          SizedWidget.size(20, 0),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColor.sendMessage,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(12),
                    child: Text('Where are you from'),
                  ),
                ),
              ),
            ],
          ),

          SizedWidget.size(20, 0),

          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(maxRadius: 10,foregroundImage: NetworkImage('https://twilsms.com/meme_admin/$profile')),
                SizedWidget.size(0, 10),
                Container(
                  decoration: BoxDecoration(
                      color: AppColor.receiveMessage,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(12),
                    child: Text('''Rishikesh'''),
                  ),
                ),
              ],
            ),
          ),



        ],
      ),
    );
  }
}


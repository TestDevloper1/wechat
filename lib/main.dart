import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:wechat/screens/home.dart';
import 'package:wechat/widgets/appbar_widget.dart';
import 'package:wechat/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: AppBarWidget.appbar(),
            drawer: DrawerWidget.drawer(context),
            body: const HomeScreen()
        ),
      ),
    );
  }
}

// https://github.com/testbrain/connect.git


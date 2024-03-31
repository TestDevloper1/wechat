// import 'dart:io';
// import 'package:meme_app/privacy_Policy/privacyPolicyScreen.dart';
// import 'package:meme_app/test.dart';
//
// import 'helper/permition_helper.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
// import 'package:meme_app/pushnotification.dart';
// import 'package:meme_app/screen/category_screen.dart';
// import 'package:meme_app/screen/home.dart';
// import 'package:meme_app/screen/search_screen.dart';
// import 'package:overlay_support/overlay_support.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'helper/firebase_const.dart';
// import 'helper/paths.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
//
//
// // Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
// //   print("Handling a background message codewaa: ${message.messageId}");
// //
// // }
//
//
//
//
// // void main() async {
// //   WidgetsFlutterBinding.ensureInitialized();
// //
// //   await Firebase.initializeApp(
// //     options: FirebaseOptions(
// //       apiKey: FirebaseConst.apiKey,
// //       appId: FirebaseConst.appId,
// //       messagingSenderId: FirebaseConst.messagingSenderId,
// //       projectId: FirebaseConst.projectId,
// //     ),
// //   );
// //
// //   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
// //
// //   /// For handling notification when the app is in terminated state
// //   RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();
// //   if (initialMessage != null) {
// //     print(initialMessage);
// //     PushNotification notification = PushNotification(
// //       title: initialMessage.notification?.title,
// //       body: initialMessage.notification?.body,
// //       dataTitle: initialMessage.data['title'],
// //       dataBody: initialMessage.data['body'],
// //     );
// //     print(notification);
// //   }
// //
// //   /// for print FCM tocken
// //   final fcmToken = await FirebaseMessaging.instance.getToken();
// //   await FirebaseMessaging.instance.setAutoInitEnabled(true);
// //   print("FCMToken $fcmToken");
// //
// //   /// Downloader
// //   await FlutterDownloader.initialize(debug: true, ignoreSsl: true);
// //
// //   runApp(const MyApp());
// // }
//
// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   var _pageController = PageController();
//   var _currentIndex = 0;
//   late ThemeData _currentTheme = ThemeData.light();
//
//   FirebaseMessaging _messaging = FirebaseMessaging.instance;
//   int _totalNotifications = 0;
//   PushNotification? _notificationInfo;
//   bool _permissionGranted = false;
//
//   @override
//   void initState() {
//     super.initState();
//     // _checkPermissions();
//     // _messaging.subscribeToTopic('topics-memes');
//     // _totalNotifications = 0;
//     // registerNotification();
//     // checkForInitialMessage();
//     // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//     //   handleNotification(message);
//     // });
//     // _createDownloadFolder();
//     _loadTheme();
//
//   }
//
//   //
//   // Future<void> _checkPermissions() async {
//   //   await _requestPermissions();
//   // }
//   //
//   // /// Request permissions
//   // Future<void> _requestPermissions() async {
//   //   await Helper.requestPermission(Permission.storage);
//   //   if (Platform.isAndroid) {
//   //     await Helper.requestPermission(Permission.notification);
//   //     await Helper.requestPermission(Permission.photos);
//   //     await Helper.requestPermission(Permission.audio);
//   //     await Helper.requestPermission(Permission.videos);
//   //   }
//   //   _permissionGranted = await Helper.getStoragePermission();
//   //   setState(() {});
//   // }
//   //
//   // /// create folder in android
//   // void _createDownloadFolder() async {
//   //   PathController _localPath = PathController();
//   //   await Permission.manageExternalStorage.request();
//   //   var stickDirectory = Directory(_localPath.localPath);
//   //   await stickDirectory.create(recursive: true);
//   // }
//   //
//   // /// for push notification
//   // void registerNotification() async {
//   //   NotificationSettings settings = await _messaging.requestPermission(
//   //     alert: true,
//   //     badge: true,
//   //     provisional: false,
//   //     sound: true,
//   //   );
//   //   if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//   //     print('User granted permission');
//   //     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//   //       handleNotification(message);
//   //     });
//   //   } else {
//   //     print('User declined or has not accepted permission');
//   //   }
//   // }
//   //
//   //
//   // void checkForInitialMessage() async {
//   //   RemoteMessage? initialMessage = await _messaging.getInitialMessage();
//   //   if (initialMessage != null) {
//   //     handleNotification(initialMessage);
//   //   }
//   // }
//   //
//   // /// for handle push notification
//   // void handleNotification(RemoteMessage message) {
//   //   PushNotification notification = PushNotification(
//   //     title: message.notification?.title,
//   //     body: message.notification?.body,
//   //     dataTitle: message.data['title'],
//   //     dataBody: message.data['body'],
//   //   );
//   //   setState(() {
//   //     _notificationInfo = notification;
//   //     _totalNotifications++;
//   //   });
//   //   if (_notificationInfo != null) {
//   //     showSimpleNotification(
//   //       Text(_notificationInfo!.title ?? ''),
//   //       subtitle: Text(_notificationInfo!.body ?? ''),
//   //       background: Colors.white,
//   //       duration: Duration(seconds: 3),
//   //     );
//   //   }
//   // }
//
//   /// for save theme in Shared Preference
//   Future<void> _saveTheme(bool isDarkMode) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setBool('isDarkMode', isDarkMode);
//   }
//
//   /// load save theme in shared preference
//   Future<void> _loadTheme() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     bool? isDarkMode = prefs.getBool('isDarkMode');
//     if (isDarkMode != null) {
//       setState(() {
//         _currentTheme = isDarkMode ? ThemeData.dark() : ThemeData.light();
//       });
//     }
//   }
//
//   /// change theme on button press
//   void changeTheme() {
//     setState(() {
//       _currentTheme =
//       _currentTheme == ThemeData.light() ? ThemeData.dark() : ThemeData.light();
//       _saveTheme(_currentTheme == ThemeData.dark());
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return OverlaySupport(
//       child: GestureDetector(
//         onTap: () {
//           FocusScope.of(context).requestFocus(FocusNode());
//           // onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
//         },
//         child: GetMaterialApp(
//           theme: _currentTheme,
//           debugShowCheckedModeBanner: false,
//           home: Scaffold(
//             appBar: AppBar(
//               title: const Text('Memes Template'),
//             ),
//             drawer: Drawer(
//               width: 280,
//               child: Container(
//                 child: Column(
//                   children: [
//                     Container(
//                       height: 150,
//                       width: MediaQuery.of(context).size.width,
//                       decoration: BoxDecoration(color: Colors.blue,),
//                       child: Center(child: Text('Memes Template',style: TextStyle(fontSize: 25),)),
//                     ),
//
//                     TextButton(
//                       onPressed: () {
//                         changeTheme();
//                       },
//                       child: Row(
//                         children: [
//                           Icon(_currentTheme == ThemeData.light() ? Icons.nightlight_round : Icons.sunny),
//                           SizedBox(width: 20,),
//                           Text(_currentTheme == ThemeData.light() ? 'Dark Mode' : 'Light Mode'),
//                         ],
//                       ),
//                     ),
//
//                     // TextButton(
//                     //   onPressed: () {
//                     //     Get.to(Search_Screen());
//                     //   },
//                     //   child: Row(
//                     //     children: [
//                     //       Icon(Icons.search),
//                     //       SizedBox(width: 20,),
//                     //       Text('Search'),
//                     //     ],
//                     //   ),
//                     // ),
//
//                     TextButton(
//                       onPressed: () {
//                         Get.back();
//                         Get.to(Privacy_Policy_Screen());
//                       },
//                       child: Row(
//                         children: [
//                           Icon(Icons.help_outline_rounded),
//                           SizedBox(width: 20,),
//                           Text('Help & Support'),
//                         ],
//                       ),
//                     ),
//
//                     // TextButton(
//                     //   onPressed: () {
//                     //     Get.to(ShowDownloadFiles());
//                     //   },
//                     //   child:
//                     //       Icon(Icons.comment),
//                     // ),
//
//                   ],
//                 ),
//               ),
//             ),
//
//             body: PageView(
//               physics: const NeverScrollableScrollPhysics(),
//               controller: _pageController,
//               children: <Widget>[
//                 HomeScreen(),
//                 Get_Category(),
//                 // VideoPage(),
//                 Search_Screen(),
//               ],
//             ),
//
//             extendBody: true,
//
//             bottomNavigationBar: SalomonBottomBar(
//               // backgroundColor: _currentTheme,
//               backgroundColor: _currentTheme.colorScheme.background,
//               currentIndex: _currentIndex,
//               onTap: (index) {
//                 setState(() {
//                   _currentIndex = index;
//                   _pageController.animateToPage(
//                     index,
//                     duration: const Duration(milliseconds: 300),
//                     curve: Curves.easeInOut,
//                   );
//                 });
//               },
//               unselectedItemColor: Colors.grey,
//               items: [
//                 SalomonBottomBarItem(
//                   icon: Icon(Icons.home),
//                   title: Text("Home"),
//                   selectedColor: Colors.teal,
//                 ),
//                 SalomonBottomBarItem(
//                   icon: Icon(Icons.category),
//                   title: Text("Category"),
//                   selectedColor: Colors.teal,
//                 ),
//
//                 // SalomonBottomBarItem(
//                 //   icon: Icon(Icons.video_library),
//                 //   title: Text("Videos"),
//                 //   selectedColor: Colors.orange,
//                 // ),
//
//                 SalomonBottomBarItem(
//                   icon: Icon(Icons.search),
//                   title: Text("Search"),
//                   selectedColor: Colors.teal,
//                 ),
//               ],
//             ),
//
//           ),
//         ),
//       ),
//     );
//   }
// }
//

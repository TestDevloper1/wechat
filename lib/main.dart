import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wechat/screens/chat_screen.dart';
import 'package:wechat/screens/home.dart';
import 'package:wechat/widgets/appbar_widget.dart';
import 'package:wechat/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      appId: "1:712791646553:android:e003916971f10c9b55ac48",
      apiKey: "AIzaSyCDdYcWi257MAVAs4tmZEJiFFsEkRaiCAY",
      messagingSenderId: "712791646553",
      projectId: "wechat-3563f",
    ),
  );

  /// Pass all uncaught errors from the framework to Crashlytics.
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  (error, stack) =>
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _pageController = PageController();
  var _currentIndex = 0;
  late ThemeData _currentTheme = ThemeData.light();

  @override
  void initState() {
    super.initState();
    _loadTheme();
  }

  /// for save theme in Shared Preference
  Future<void> _saveTheme(bool isDarkMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', isDarkMode);
  }

  /// load save theme in shared preference
  Future<void> _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isDarkMode = prefs.getBool('isDarkMode');
    if (isDarkMode != null) {
      setState(() {
        _currentTheme = isDarkMode ? ThemeData.dark() : ThemeData.light();
      });
    }
  }

  /// change theme on button press
  void changeTheme() {
    setState(() {
      _currentTheme = _currentTheme == ThemeData.light()
          ? ThemeData.dark()
          : ThemeData.light();
      _saveTheme(_currentTheme == ThemeData.dark());
    });
  }

  @override


  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: _currentTheme,
      debugShowCheckedModeBanner: false,
      home:  GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: Scaffold(
                appBar: AppBarWidget.appbar(),
                drawer: DrawerWidget.drawer(context, changeTheme),
                body: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  children: const <Widget>[
                    HomeScreen(),
                    ChatScreen(
                      profile: '',
                      name: '',
                    ),
                    HomeScreen(),
                    ChatScreen(
                      profile: '',
                      name: '',
                    ),
                  ],
                ),
                extendBody: true,
                bottomNavigationBar: SalomonBottomBar(
                  // backgroundColor: _currentTheme,
                  backgroundColor: _currentTheme.colorScheme.background,
                  currentIndex: _currentIndex,
                  onTap: (index) {
                    setState(() {
                      _currentIndex = index;
                      _pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    });
                  },

                  unselectedItemColor: Colors.grey,
                  items: [
                    SalomonBottomBarItem(
                      icon: const Icon(Icons.chat),
                      title: const Text("Chat"),
                      selectedColor: Colors.teal,
                    ),
                    SalomonBottomBarItem(
                      icon: const Icon(Icons.call),
                      title: const Text("Call"),
                      selectedColor: Colors.teal,
                    ),
                    SalomonBottomBarItem(
                      icon: const Icon(Icons.camera_alt),
                      title: const Text("Camera"),
                      selectedColor: Colors.teal,
                    ),
                    SalomonBottomBarItem(
                      icon: const Icon(Icons.person),
                      title: const Text("Profile"),
                      selectedColor: Colors.teal,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}



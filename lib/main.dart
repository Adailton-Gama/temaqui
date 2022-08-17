import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:temaqui/pages/home/Home_Screen.dart';
import 'package:temaqui/pages/login/login_page.dart';
import 'package:temaqui/pages/splashScreen/Splash_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double xOffset = 0;
  double yOffset = 0;

  List<Widget> stackOrder = [HomeScreen(), LoginPage()];

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade400,
        primarySwatch: Colors.purple,
      ),
      home: const Splash_Screen(),
    );
  }
}

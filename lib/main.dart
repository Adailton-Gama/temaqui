import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:temaqui/data/config.dart';
import 'package:temaqui/pages/home/Home_Screen.dart';
import 'package:temaqui/pages/login/login_page.dart';
import 'package:temaqui/pages/splashScreen/Splash_Screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
    Firebase.initializeApp();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: primaryColor,
        primarySwatch: Colors.purple,
      ),
      home: const Splash_Screen(),
    );
  }
}

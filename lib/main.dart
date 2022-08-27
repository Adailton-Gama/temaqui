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
  final keyApplicationId = 'U9DFC5LIYasVUy8AEWc4xQs7KoIuFyVMAiFgrvW6';
  final keyClientKey = 'pNsYsIakmE9lF2Z00OAtcInC1zz6nMJOnoPtcJRx';
  final keyParseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, autoSendSessionId: true);
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

import 'dart:convert';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class Back4app {
  static final String _baseUrl = "https://parseapi.back4app.com/classes/";

  static Future<void> initParse() async {
    final keyApplicationId = 'U9DFC5LIYasVUy8AEWc4xQs7KoIuFyVMAiFgrvW6';
    final keyClientKey = 'pNsYsIakmE9lF2Z00OAtcInC1zz6nMJOnoPtcJRx';
    final keyParseServerUrl = 'https://parseapi.back4app.com';

    await Parse().initialize(keyApplicationId, keyParseServerUrl,
        clientKey: keyClientKey, autoSendSessionId: true);
  }
}

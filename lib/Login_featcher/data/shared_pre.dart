import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  late SharedPreferences prefs;
  static initShared() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
  }
// Obtain shared preferences.

  setToken(token) async {
    await prefs.setString('token', token);
  }

  Future getToken() async {
    final String? tokenValue = prefs.getString('token');
    return tokenValue;
  }
}

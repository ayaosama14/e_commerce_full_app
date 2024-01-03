import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static late SharedPreferences? prefs;
  static initShared() async {
    prefs = await SharedPreferences.getInstance();
  }
// Obtain shared preferences.

  static setToken(token) async {
    return await prefs?.setString('token', token);
  }

  static getToken() {
    final String? tokenValue = prefs?.getString('token');
    return tokenValue;
  }
}

//   static Future<bool> removeData({required String key}) async {
//     return sharedPreferences.remove(key);
//   }
// }

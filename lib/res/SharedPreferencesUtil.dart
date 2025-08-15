import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/route/app_routes.dart';


// class SharedPrefUtils {
//   static late SharedPreferences _prefs;
//
//   static Future<void> init() async {
//     _prefs = await SharedPreferences.getInstance();
//   }
//
//   static void setUserToken(String userToken){
//      _prefs.setString("userToken", userToken);
//   }
//
//   static String getUserToken(){
//     return _prefs.getString("userToken")??"";
//   }
//
//   static void removeUserToken(){
//      _prefs.remove("userToken");
//   }
// }


import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefViewModel extends ChangeNotifier {
  String _userToken = "";

  String get userToken => _userToken;

  SharedPrefViewModel() {
    loadUserToken();
  }

  Future<String> loadUserToken() async {
    final prefs = await SharedPreferences.getInstance();
    _userToken = prefs.getString("userToken") ?? "";
    notifyListeners();
    return _userToken;
  }

  Future<void> setUserToken(String userToken) async {
    final prefs = await SharedPreferences.getInstance();
    print(userToken);
    await prefs.setString("userToken", userToken);
    print(await prefs.setString("userToken", userToken));
    _userToken = userToken;
    notifyListeners();
  }

  Future<void> removeUserToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("userToken");
    _userToken = "";
    notifyListeners();
  }

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    _userToken = prefs.getString("userToken") ?? "";
    return _userToken.isNotEmpty;
  }
}


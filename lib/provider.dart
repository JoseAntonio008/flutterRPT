import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider extends ChangeNotifier {
  bool isLogged;

  UserProvider({
    this.isLogged = false,
  });

  bool get isLoggedIn => isLogged;

  Future<void> loadLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    isLogged = prefs.getBool('isLoggedIn') ?? false;
    print(isLogged);
    notifyListeners();
  }

  Future<void> setLoginStatus(bool status) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', status);
    isLogged = status;
    notifyListeners();
  }

  Future<void> login() async {
    await setLoginStatus(true);
  }

  Future<void> logout() async {
    await setLoginStatus(false);
  }
}

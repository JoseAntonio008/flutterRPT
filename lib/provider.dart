import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/services/api_service.dart';
import './models/user_model.dart';

class UserProvider extends ChangeNotifier {
  User? _user;
  bool isLogged;

  UserProvider({
    this.isLogged = false,
  });

  bool get isLoggedIn => isLogged;
  User? get user => _user;

  Future<void> loadLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString('user');
    if (!prefs.containsKey('isLoggedIn')) {
    print('isLoggedIn preference not found, defaulting to false.');
  }

    isLogged = prefs.getBool('isLoggedIn') ?? false;

    if (userJson != null) {
      _user = User.fromJson(jsonDecode(userJson));
    }
    print(isLogged);
    notifyListeners();
  }

  Future<void> saveUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        'user',
        jsonEncode({
          'id': user.id,
          'name': user.name,
          'email': user.email,
          'roles': user.roles,
          'token': user.token,
        }));
    _user = user;
    isLogged = true;
    print(isLoggedIn);
    await prefs.setBool('isLoggedIn', true);
    if (!prefs.containsKey('isLoggedIn')) {
    print('isLoggedIn preference not found, defaulting to false.');
  }
    notifyListeners();
  }

  Future<void> setLoginStatus(bool status) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', status);
    isLogged = status;
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    
      final apiService = ApiService();
      final user = await apiService.login(email, password);
      await saveUser(user);
    
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user');
    await prefs.setBool('isLoggedIn', false);
    _user = null;
    isLogged = false;
    print(isLoggedIn);
    notifyListeners();
  }
}

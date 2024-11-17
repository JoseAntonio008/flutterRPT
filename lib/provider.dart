import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier{
  bool isLogged;

  UserProvider({
    this.isLogged = false,
  });
  
  bool get isLoggedIn => isLogged;
  
  void login(){
    isLogged = true;
    notifyListeners();
  }
  void logout(){
    isLogged = false;
    notifyListeners();
  }
}
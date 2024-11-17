import 'package:flutter/material.dart';
import 'package:test_app/Pages/Home.dart';
import 'package:test_app/Pages/Login.dart';
import 'package:provider/provider.dart';
import 'provider.dart';

class AppRoutes {
  static const String Login = "/login";
  static const String Home = "/home";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) {
        // Using context.watch to listen for changes in the AuthProvider
        final isLoggedIn = context.watch<UserProvider>().isLoggedIn;

        switch (settings.name) {
          case Login:
            // If logged in, redirect to Home
            if (isLoggedIn) {
              return HomePage();
            }
            return LoginPage();

          case Home:
            // If logged in, show HomePage, otherwise go to LoginPage
            if (isLoggedIn) {
              return HomePage();
            } else {
              return LoginPage();
            }

          default:
            return LoginPage();
        }
      },
    );
  }
}

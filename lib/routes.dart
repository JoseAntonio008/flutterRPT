import 'package:flutter/material.dart';
import 'package:test_app/Pages/Home.dart';
import 'package:test_app/Pages/Login.dart';
import 'package:provider/provider.dart';
import 'provider.dart';

class AppRoutes {
  static const String Login = "/login";
  static const String Home = "/home";
  static const String Default = '/';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) {
        return Consumer<UserProvider>(
          builder: (context, userProvider, child) {
            final isLoggedIn = userProvider.isLoggedIn;

            // Handle route logic based on login state
            switch (settings.name) {
              case Default:
                  

              case Login:
                if (isLoggedIn) {
                  // If logged in, navigate to Home immediately.
                  Future.microtask(() {
                    Navigator.pushReplacementNamed(context, AppRoutes.Home);
                  });
                  return Container(); // Show an empty container while redirecting
                }
                return LoginPage();
              case Home:
                if (isLoggedIn) {
                  return HomePage();
                } else {
                  // If not logged in, return to the LoginPage
                  return LoginPage();
                }

              default:
                return LoginPage();
            }
          },
        );
      },
    );
  }
}

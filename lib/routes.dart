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
        // The login check is done here within the widget, not directly in the route
        return Consumer<UserProvider>(
          builder: (context, userProvider, child) {
            final isLoggedIn = userProvider.isLoggedIn;

            switch (settings.name) {
              case Login:
                if (isLoggedIn) {
                  // Redirect to Home if logged in
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Navigator.pushReplacementNamed(context, AppRoutes.Home);
                  });
                  return Container(); // Show an empty container while redirecting
                }
                return LoginPage();

              case Home:
                if (isLoggedIn) {
                  return HomePage();
                } else {
                  // If not logged in, return the LoginPage
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

import 'package:flutter/material.dart';
import 'package:test_app/Pages/Home.dart';
import 'package:test_app/Pages/Login.dart';
import 'package:provider/provider.dart';
import 'package:test_app/Pages/Vote.dart';
import 'provider.dart';

class AppRoutes {
  static const String Login = "/login";
  static const String Home = "/home";
  static const String Default = '/';
  static const String Voting = '/vote';

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
                  return HomePage();
                 // Show an empty container while redirecting
                }else{
                   return LoginPage();
                }
               
                
                
              case Home:
                if (isLoggedIn) {
                  return HomePage();
                } else {
                  // If not logged in, return to the LoginPage
                  return LoginPage();
                }
              case Voting:
                if(isLoggedIn){
                  return VotingPage();
                }else{
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

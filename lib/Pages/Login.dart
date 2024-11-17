
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage ({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.read<UserProvider>().login();
            print("${context.read<UserProvider>().isLoggedIn}");
            Navigator.pushNamed(context, '/home'); // Navigate to HomePage
          },
          child: Text('hello'),
        ),
      ),
    );
  }
}
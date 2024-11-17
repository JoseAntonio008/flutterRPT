import 'package:flutter/material.dart';
import 'package:test_app/provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage ({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(body: ElevatedButton(onPressed: (){
      context.read<UserProvider>().logout();
    }, child: Text("logout")),);
  }
  
}
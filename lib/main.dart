import 'package:flutter/material.dart';
import 'package:test_app/routes.dart';
import 'package:provider/provider.dart';
import 'provider.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = "Real Property Tax";
    

    return  MultiProvider(
      providers: [ChangeNotifierProvider(create: (context)=> UserProvider())],
      child:const MaterialApp(
          title: appTitle,
          initialRoute: AppRoutes.Login,
          onGenerateRoute: AppRoutes.generateRoute,
          
        ),
    );}}
      
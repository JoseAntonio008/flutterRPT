import 'package:flutter/material.dart';
import 'package:test_app/routes.dart';
import 'package:provider/provider.dart';
import 'provider.dart';
import 'package:flutter/rendering.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = "10k";

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => UserProvider()..loadLoginStatus())
      ],
      child: const MaterialApp(
        title: appTitle,
        onGenerateRoute: AppRoutes.generateRoute,
        initialRoute: '/home',
      ),
    );
  }
}

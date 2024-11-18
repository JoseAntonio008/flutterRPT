import 'package:flutter/material.dart';
import 'package:test_app/Pages/Profile.dart';
import 'package:test_app/provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // List of widgets for each tab
  final List<Widget> _pages = [
    Center(child: Text("Home Page Content")),
    Center(child: Profile()),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isWideScreen = MediaQuery.of(context).size.width > 600;
    final isDesktop = MediaQuery.of(context).size.width < 600;

    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: isWideScreen
            ? AppBar(
                automaticallyImplyLeading: false,
                title: const Text("Top Bar"),
              )
            : null,
        body: _pages[_selectedIndex],
        // floatingActionButton: FloatingActionButton(onPressed: () {
        //   print("floating ");
        // }),
        bottomNavigationBar: isDesktop
            ? BottomNavigationBar(
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Profile',
                  ),
                ],
              )
            : null);
  }
}

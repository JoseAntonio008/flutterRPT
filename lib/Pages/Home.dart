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
    Center(child: Builder(builder: (context) {
      final user = context.watch<UserProvider>().user;
      return SingleChildScrollView(
        child: Center(
          child: SizedBox(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'images/spcLOGO.png',
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text('"Hi ${user?.name}"'),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5))),
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/vote');
                          },
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            // Ensures the Row doesn't take up more space than needed
                            children: [
                              Icon(size: 20, Icons.fingerprint_outlined),
                              Text("VOTE"),
                              SizedBox(width: 8),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      );
    })),
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
    print("on home page");

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

import 'package:flutter/material.dart';
import '../navbar.dart';
import 'profile_page.dart';
import 'settings_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  final pages = [
    Center(child: Text("Dashboard", style: TextStyle(fontSize: 24))),
    ProfilePage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: Navbar(
        currentIndex: index,
        onTap: (i) => setState(() => index = i),
      ),
    );
  }
}

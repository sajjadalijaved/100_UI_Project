import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
// ignore_for_file: avoid_unnecessary_containers, library_private_types_in_public_api

class BottomNavyBarExample extends StatefulWidget {
  const BottomNavyBarExample({Key? key}) : super(key: key);

  @override
  _BottomNavyBarExampleState createState() => _BottomNavyBarExampleState();
}

class _BottomNavyBarExampleState extends State<BottomNavyBarExample> {
  int _selectedIndex = 0;
  List<Widget> pages = [
    _buildPage(
      icon: Icons.apps,
      title: '@theflutterlover',
      color: Colors.red,
    ),
    _buildPage(
      icon: Icons.person,
      title: 'Profile',
      color: Colors.pink,
    ),
    _buildPage(
      icon: Icons.message,
      title: 'Messages',
      color: Colors.orange,
    ),
    _buildPage(
      icon: Icons.settings,
      title: 'Settings',
      color: Colors.blue,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _selectedIndex,
          showElevation: false,
          onItemSelected: (index) => setState(() {
            _selectedIndex = index;
          }),
          items: [
            BottomNavyBarItem(
              icon: const Icon(Icons.apps),
              title: const Text('Home'),
              activeColor: Colors.red,
            ),
            BottomNavyBarItem(
                icon: const Icon(Icons.people),
                title: const Text('Users'),
                activeColor: Colors.purpleAccent),
            BottomNavyBarItem(
                icon: const Icon(Icons.message),
                title: const Text('Messages'),
                activeColor: Colors.pink),
            BottomNavyBarItem(
                icon: const Icon(Icons.settings),
                title: const Text('Settings'),
                activeColor: Colors.blue),
          ],
        ));
  }
}

Widget _buildPage({IconData? icon, String? title, Color? color}) {
  return Container(
    color: color,
    child: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(icon, size: 200.0, color: Colors.white),
          Text(title!,
              style: const TextStyle(color: Colors.white, fontSize: 20)),
        ],
      ),
    ),
  );
}

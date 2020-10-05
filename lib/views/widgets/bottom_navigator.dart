import 'package:Solace/theme/theme.dart';
import 'package:Solace/views/screens/group.dart';
import 'package:Solace/views/screens/home.dart';
import 'package:Solace/views/screens/lessons.dart';
import 'package:Solace/views/screens/profile.dart';
import 'package:flutter/material.dart';

class BottomNavigator extends StatefulWidget {
  @override
  _BottomNavigatorState createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int _selectedIndex = 0;
  static TextStyle optionStyle =
      TextStyle(fontSize: 12, fontWeight: FontWeight.w500);
  static List<Widget> _widgetOptions = <Widget>[
    Home(),
    Group(),
    Lessons(),
    Profile()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Scaffold(
        body: _widgetOptions[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(
                'Home',
                style: TextStyle(fontSize: 13),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_library),
              title: Text(
                'Group',
                style: TextStyle(fontSize: 13),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_library),
              title: Text(
                'Lessons',
                style: TextStyle(fontSize: 13),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_library),
              title: Text(
                'Profile',
                style: TextStyle(fontSize: 13),
              ),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: primaryTeal,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

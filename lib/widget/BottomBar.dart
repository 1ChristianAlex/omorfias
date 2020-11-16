import 'package:flutter/material.dart';
import 'package:omorfias/service/Auth/Auth.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 1;

  void doActionBottom(int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/explorer');
        break;
      default:
        AuthService _auth = AuthService();
        _auth.logout();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: doActionBottom,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          title: Text(
            'Explorar',
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          title: Text('Horarios'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.comment),
          title: Text('Inbox'),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            size: 30.0,
          ),
          title: Text('Perfil'),
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      unselectedLabelStyle: TextStyle(color: Colors.black),
    );
  }
}

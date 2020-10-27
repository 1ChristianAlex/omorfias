import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          title: Text(
            'Explorar',
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          title: Text('Favoritos'),
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

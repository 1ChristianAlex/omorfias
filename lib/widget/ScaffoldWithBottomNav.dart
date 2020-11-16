import 'package:flutter/material.dart';
import 'BottomBar.dart';

class ScaffoldWithBottomNav extends StatelessWidget {
  final Widget child;
  ScaffoldWithBottomNav({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomBar(),
      body: SingleChildScrollView(
        child: this.child,
      ),
    );
  }
}

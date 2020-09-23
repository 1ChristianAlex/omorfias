import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double heightLogo;

  Logo({this.heightLogo});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image(
        height: this.heightLogo ?? 150,
        image: AssetImage('lib/assets/images/logo.png'),
      ),
    );
  }
}

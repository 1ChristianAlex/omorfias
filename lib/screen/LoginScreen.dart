import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:omorfias/widget/LoginForm.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[LoginForm()],
          ),
        ),
      ),
    );
  }
}

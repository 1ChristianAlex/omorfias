import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:omorfias/screen/Login/widgets/LoginForm.dart';
import 'package:omorfias/widget/Logo.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                child: Logo(),
                padding: EdgeInsets.only(top: 20),
              ),
              Container(
                child: LoginForm(),
                padding: EdgeInsets.only(top: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

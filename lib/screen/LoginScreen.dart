import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:omorfias/widget/LoginForm.dart';
import 'package:omorfias/widget/Logo.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(131, 80, 46, 1),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Flexible(
                child: Logo(),
              ),
              Flexible(
                child: LoginForm(),
                flex: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}

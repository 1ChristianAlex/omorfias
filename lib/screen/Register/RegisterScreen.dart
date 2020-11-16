import 'package:flutter/material.dart';
import 'package:omorfias/widget/Logo.dart';
import 'package:omorfias/screen/Register/widgets/RegisterForm.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 70),
                child: Logo(),
              ),
              RegisterForm()
            ],
          ),
        ),
      ),
    );
  }
}

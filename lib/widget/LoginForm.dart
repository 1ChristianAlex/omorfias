import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:omorfias/model/user.dart';
import 'package:omorfias/redux/actions.dart';
import 'package:omorfias/redux/appState.dart';
import 'package:redux/redux.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String name = '';
  String password = '';

  @override
  void initState() {
    super.initState();
    name = 'Nome';
    password = 'Pass';
  }

  final _formKey = GlobalKey<FormState>();

  void setName(value) {
    setState(() {
      name = value;
    });
  }

  void setPass(value) {
    setState(() {
      password = value;
    });
  }

  void submitLogin() {
    Store<AppState> store = StoreProvider.of<AppState>(context);
    User userData = User(userName: name, id: 1);
    store.dispatch(UpdateUserAction(userData));
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(hintText: 'Email'),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Empty Text';
                }
                return null;
              },
              onChanged: setName,
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Password'),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Empty Text';
                }
                return null;
              },
              onChanged: setPass,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ButtonTheme(
                minWidth: double.infinity,
                child: RaisedButton(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
                  onPressed: this.submitLogin,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

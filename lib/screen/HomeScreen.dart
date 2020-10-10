import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:omorfias/model/user.dart';
import 'package:omorfias/redux/appState.dart';
import 'package:redux/redux.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, User>(
      distinct: true,
      converter: (Store<AppState> store) => store.state.user,
      builder: (context, user) {
        return Scaffold(
          appBar: AppBar(title: Text(user.userName)),
          body: Container(),
        );
      },
    );
  }
}

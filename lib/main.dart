import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:localstorage/localstorage.dart';
import 'package:omorfias/redux/appState.dart';
import 'package:omorfias/screen/HomeScreen.dart';
import 'package:omorfias/screen/LoginScreen.dart';
import 'package:redux/redux.dart';
import 'package:omorfias/redux/reducer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = Store<AppState>(
      appStateReducer,
      initialState: AppState.initialState(),
    );

    return StoreProvider<AppState>(store: store, child: OmorfiasApp());
  }
}

class OmorfiasApp extends StatelessWidget {
  final LocalStorage storage = new LocalStorage('OmorfiasApp');

  Future<bool> hasToken() async {
    await storage.ready;
    storage.setItem('token', 'valo');

    String token = storage.getItem('token');

    if (token.isNotEmpty) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: hasToken(),
        builder: (BuildContext context, snapshot) {
          return MaterialApp(
            title: 'Omorfias',
            theme: ThemeData(
              primarySwatch: Colors.purple,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            routes: <String, WidgetBuilder>{
              '/login': (BuildContext context) => LoginScreen(),
              '/home': (BuildContext context) => HomeScreen(),
              '/': (BuildContext context) =>
                  snapshot.data == null ? LoginScreen() : HomeScreen()
            },
          );
        });
  }
}

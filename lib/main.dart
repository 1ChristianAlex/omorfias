import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:omorfias/config/SecureStorage.dart';
import 'package:omorfias/enum/DesignSystem.dart';
import 'package:omorfias/redux/appState.dart';
import 'package:omorfias/screen/HomeScreen.dart';
import 'package:omorfias/screen/LoginScreen.dart';
import 'package:omorfias/screen/RegisterScreen.dart';
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

class OmorfiasApp extends StatefulWidget {
  @override
  _OmorfiasAppState createState() => _OmorfiasAppState();
}

class _OmorfiasAppState extends State<OmorfiasApp> {
  final SecureStorage secureStorage = SecureStorage();

  Future<bool> hasToken() async {
    String token = await secureStorage.getToken();
    bool isAuth = false;
    if (token != null) {
      isAuth = token.isNotEmpty;
    }

    return isAuth;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: hasToken(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return MaterialApp(
            title: 'Omorfias',
            theme: ThemeData(
              primarySwatch: Colors.grey,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              fontFamily: DesignSystem.appFont,
            ),
            routes: <String, WidgetBuilder>{
              '/register': (BuildContext context) => RegisterScreen(),
              '/login': (BuildContext context) => LoginScreen(),
              '/home': (BuildContext context) => HomeScreen(),
              '/': (BuildContext context) =>
                  snapshot.data == true ? HomeScreen() : LoginScreen()
            },
            initialRoute: '/',
          );
        }
        return MaterialApp(
          title: 'Omorfias',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            fontFamily: DesignSystem.appFont,
          ),
          builder: (BuildContext context, snapshot) {
            return Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

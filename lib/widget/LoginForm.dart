import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:omorfias/model/login.dart';
import 'package:omorfias/model/user.dart';
import 'package:omorfias/redux/actions.dart';
import 'package:omorfias/redux/appState.dart';
import 'package:omorfias/service/Auth/Auth.dart';
import 'package:omorfias/widget/RoundedButtom.dart';
import 'package:omorfias/widget/RoundedTextField.dart';
import 'package:redux/redux.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

// class _ViewModelLogin {
//   final User user;
//   final Function(User) submitLogin;

//   _ViewModelLogin({this.user, this.submitLogin});

//   factory _ViewModelLogin.create(Store<AppState> store) {
//     _submitLogin(User userData) async {
//       store.dispatch(UpdateUserAction(userData));
//     }
//     return _ViewModelLogin(user: store.state.user, submitLogin: _submitLogin);
//   }
// }

class _LoginFormState extends State<LoginForm> {
  String email;
  String password;

  @override
  void initState() {
    super.initState();
    email = '';
    password = '';
  }

  final _formKey = GlobalKey<FormState>();

  void setEmail(value) {
    setState(() {
      email = value;
    });
  }

  void setPass(value) {
    setState(() {
      password = value;
    });
  }

  void submitLogin() async {
    if (this._formKey.currentState.validate()) {
      Store<AppState> _store = StoreProvider.of<AppState>(context);
      AuthService _authService = AuthService();

      Login loginData = Login(email: email, password: password);

      User userResponse = await _authService.login(loginData);

      _store.dispatch(UpdateUserAction(userResponse));
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  void goRegister() {
    Navigator.pushReplacementNamed(context, '/register');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 32),
              child: Text(
                'Seja bem vindo ao seu aplicativo',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 10),
              child: RoundedTextField(
                onChanged: setEmail,
                placeholder: 'E-mail',
                validator: (value) {
                  if (value.length == 0) {
                    return "Email esta vazio";
                  }
                  return null;
                },
              ),
            ),
            Container(
              child: RoundedTextField(
                hideText: true,
                onChanged: setPass,
                placeholder: 'Senha',
                validator: (value) {
                  if (value.length == 0) {
                    return "Senha esta vazia";
                  }
                  return null;
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 16),
                  child: InkWell(
                    child: Text(
                      'Esqueci minha senha',
                      style: TextStyle(color: Colors.blue),
                    ),
                    onTap: () => {},
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(top: 10, bottom: 32),
              child: RoundedButtom(
                key: _formKey,
                onPressed: submitLogin,
                textWidget: Text(
                  'Entrar'.toUpperCase(),
                  style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Text('Não possui uma conta? '),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: InkWell(
                    child: Text(
                      'Cadastre-se agora',
                      style: TextStyle(color: Colors.blue),
                    ),
                    onTap: goRegister,
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 16),
              child: RoundedButtom(
                key: _formKey,
                onPressed: submitLogin,
                textWidget: Text(
                  'Continuar com o Google',
                  style: TextStyle(
                    color: Color.fromRGBO(124, 124, 124, 1),
                  ),
                ),
                iconWidget: Image(
                  image: AssetImage('lib/assets/images/google_logo.png'),
                  height: 24.0,
                ),
                bgColor: Colors.white,
                borderColor: Color.fromRGBO(226, 226, 226, 1),
              ),
            ),
            Container(
              child: RoundedButtom(
                key: _formKey,
                onPressed: submitLogin,
                textWidget: Text(
                  'Continuar com o Facebook',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                iconWidget: FaIcon(
                  FontAwesomeIcons.facebookSquare,
                  color: Colors.white,
                ),
                bgColor: Color.fromRGBO(28, 116, 252, 1),
                borderColor: Color.fromRGBO(226, 226, 226, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

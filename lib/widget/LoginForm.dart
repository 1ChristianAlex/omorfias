import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:omorfias/model/user.dart';
import 'package:omorfias/redux/actions.dart';
import 'package:omorfias/redux/appState.dart';
import 'package:omorfias/widget/RoundedButtom.dart';
import 'package:omorfias/widget/RoundedTextField.dart';
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
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 32),
              child: Text(
                'Seja bem vindo ao seu aplicativo',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Flexible(
              child: RoundedTextField(
                onChanged: setPass,
                placeholder: 'E-mail',
                validator: (value) {
                  if (value.isEmpty) {
                    return "Email esta vazio";
                  }
                  return "";
                },
              ),
            ),
            Flexible(
              flex: 1,
              child: RoundedTextField(
                onChanged: setPass,
                placeholder: 'Senha',
                validator: (value) {
                  if (value.isEmpty) {
                    return "Senha esta vazia";
                  }
                  return "";
                },
              ),
            ),
            Flexible(
              fit: FlexFit.loose,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 16, bottom: 16),
                    child: InkWell(
                      child: Text(
                        'Esqueci minha senha',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                      onTap: () => {},
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                child: RoundedButtom(
                  key: _formKey,
                  onPressed: submitLogin,
                  textButton: 'Entrar'.toUpperCase(),
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: InkWell(
                      child: Text(
                        'Não possui uma conta? ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onTap: () => {},
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: InkWell(
                      child: Text(
                        'Cadastre-se agora',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                      onTap: () => {},
                    ),
                  ),
                ],
              ),
            ),
            // Flexible(
            //   flex: 2,
            //   child: Padding(
            //     padding: const EdgeInsets.only(top: 16, bottom: 16),
            //     child: RoundedButtom(
            //       key: _formKey,
            //       onPressed: submitLogin,
            //       textButton: 'Não possui uma conta? Cadastre-se agora',
            //       bgColor: Colors.white,
            //       textColor: Colors.black,
            //     ),
            //   ),
            // ),
            Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: RoundedButtom(
                  key: _formKey,
                  onPressed: submitLogin,
                  textButton: 'Continuar com o Google',
                  bgColor: Colors.white,
                  borderColor: Color.fromRGBO(226, 226, 226, 1),
                  textColor: Color.fromRGBO(124, 124, 124, 1),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: RoundedButtom(
                  key: _formKey,
                  onPressed: submitLogin,
                  textButton: 'Continuar com o Facebook',
                  bgColor: Color.fromRGBO(28, 116, 252, 1),
                  borderColor: Color.fromRGBO(226, 226, 226, 1),
                  textColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

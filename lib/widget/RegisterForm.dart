import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:omorfias/widget/RoundedButtom.dart';
import 'package:omorfias/widget/RoundedTextField.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  String name;
  String lastName;
  String email;
  String password;

  @override
  void initState() {
    super.initState();

    name = '';
    lastName = '';
    email = '';
    password = '';
  }

  void setName(String value) {
    this.setState(() {
      name = value;
    });
  }

  void setLastName(String value) {
    this.setState(() {
      lastName = value;
    });
  }

  void setEmail(String value) {
    this.setState(() {
      email = value;
    });
  }

  void setPassord(String value) {
    this.setState(() {
      password = value;
    });
  }

  void registerSubmit() async {
    _formKeyRegister.currentState.validate();
  }

  void goLogin() {
    Navigator.pushReplacementNamed(context, '/login');
  }

  GlobalKey<FormState> _formKeyRegister = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Form(
        key: _formKeyRegister,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              child: Text(
                'Com sua conta você pode mais! Cadastre-se agora e aproveite!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: Text(
                'Para começarmos informe alguns dados básicos.',
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 5),
              child: RoundedTextField(
                onChanged: setName,
                placeholder: 'Nome',
                validator: (value) {
                  if (value.length == 0) {
                    return "Nome é obrigatorio";
                  }
                  return null;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 5),
              child: RoundedTextField(
                onChanged: setEmail,
                placeholder: 'Último Nome',
                validator: (value) {
                  if (value.length == 0) {
                    return "Último Nome é obrigatorio";
                  }
                  return null;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 5),
              child: RoundedTextField(
                onChanged: setEmail,
                placeholder: 'Digite seu E-mail',
                validator: (value) {
                  if (value.length == 0) {
                    return "E-mail é obrigatorio";
                  }
                  return null;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 5),
              child: RoundedTextField(
                onChanged: setEmail,
                placeholder: 'Digite seu usuário',
                validator: (value) {
                  if (value.length == 0) {
                    return "Usuário é obrigatorio";
                  }
                  return null;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 5),
              child: RoundedTextField(
                hideText: true,
                onChanged: setPassord,
                placeholder: 'Senha',
                validator: (value) {
                  if (value.length == 0) {
                    return "Senha é obrigatorio";
                  }
                  return null;
                },
              ),
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(
                    'A senha deve possuir letras e números.',
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(top: 25, bottom: 25),
              child: RoundedButtom(
                key: _formKeyRegister,
                onPressed: registerSubmit,
                textWidget: Text(
                  'Continuar'.toUpperCase(),
                  style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: Text(
                      'Já possui uma conta?',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: InkWell(
                      child: Text(
                        ' Entre agora',
                        style: TextStyle(color: Colors.blue),
                      ),
                      onTap: goLogin,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
              child: Text(
                'OU',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 64),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 35, bottom: 10),
              child: RoundedButtom(
                onPressed: registerSubmit,
                textWidget: Text(
                  'Continuar com o Google',
                  style: TextStyle(color: Color.fromRGBO(124, 124, 124, 1)),
                ),
                bgColor: Colors.white,
                iconWidget: Image(
                  image: AssetImage('lib/assets/images/google_logo.png'),
                  height: 24.0,
                ),
                borderColor: Color.fromRGBO(226, 226, 226, 1),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 20),
              child: RoundedButtom(
                onPressed: registerSubmit,
                textWidget: Text(
                  'Continuar com o Facebook',
                  style: TextStyle(color: Colors.white),
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

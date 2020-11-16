import 'package:flutter/material.dart';
import 'package:omorfias/widget/CircleButton.dart';

class PopButton extends StatefulWidget {
  @override
  _PopButtonState createState() => _PopButtonState();
}

class _PopButtonState extends State<PopButton> {
  void popScreen() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return CircleButton(
      onPressed: popScreen,
      iconChild: Icon(
        Icons.arrow_back,
      ),
    );
  }
}

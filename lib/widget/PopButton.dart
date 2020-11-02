import 'package:flutter/material.dart';

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
    return Container(
      padding: EdgeInsets.all(5),
      child: MaterialButton(
        color: Colors.white,
        shape: CircleBorder(),
        onPressed: popScreen,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Icon(
            Icons.arrow_back,
          ),
        ),
      ),
    );
  }
}

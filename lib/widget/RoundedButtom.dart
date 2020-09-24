import 'package:flutter/material.dart';
import 'package:omorfias/enum/DesignSystem.dart';

class RoundedButtom extends StatefulWidget {
  final Function onPressed;
  final String textButton;
  final Color bgColor;
  final Color textColor;
  final Color borderColor;

  @override
  _RoundedButtomState createState() => _RoundedButtomState();

  RoundedButtom({
    Key key,
    this.onPressed,
    this.textButton,
    this.bgColor,
    this.textColor,
    this.borderColor,
  });
}

class _RoundedButtomState extends State<RoundedButtom> {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: double.infinity,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DesignSystem.rounded),
          side: BorderSide(
            color: widget.textColor ?? Color.fromRGBO(255, 255, 255, 1),
          ),
        ),
        onPressed: widget.onPressed,
        color: widget.bgColor ?? Color.fromRGBO(0, 0, 0, 1),
        padding: EdgeInsets.only(top: 20, bottom: 20),
        child: Text(
          widget.textButton,
          style: TextStyle(
            color: widget.textColor ?? Color.fromRGBO(255, 255, 255, 1),
          ),
        ),
      ),
    );
  }
}

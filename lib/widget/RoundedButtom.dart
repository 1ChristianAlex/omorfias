import 'package:flutter/material.dart';
import 'package:omorfias/enum/DesignSystem.dart';

class RoundedButtom extends StatefulWidget {
  final Function onPressed;
  final Color bgColor;
  final Text textWidget;
  final Widget iconWidget;
  final Color borderColor;

  @override
  _RoundedButtomState createState() => _RoundedButtomState();

  RoundedButtom({
    Key key,
    this.onPressed,
    this.textWidget,
    this.iconWidget,
    this.bgColor,
    this.borderColor,
  });
}

class _RoundedButtomState extends State<RoundedButtom> {
  @override
  Widget build(BuildContext context) {
    if (widget.iconWidget == null) {
      return ButtonTheme(
        minWidth: double.infinity,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(DesignSystem.rounded),
            side: BorderSide(
              color: widget.borderColor ?? Color.fromRGBO(255, 255, 255, 1),
            ),
          ),
          onPressed: widget.onPressed,
          color: widget.bgColor ?? Color.fromRGBO(0, 0, 0, 1),
          padding: EdgeInsets.only(top: 20, bottom: 20),
          child: widget.textWidget,
        ),
      );
    }
    return ButtonTheme(
      minWidth: double.infinity,
      child: RaisedButton.icon(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DesignSystem.rounded),
          side: BorderSide(
            color: widget.borderColor ?? Color.fromRGBO(255, 255, 255, 1),
          ),
        ),
        onPressed: widget.onPressed,
        color: widget.bgColor ?? Color.fromRGBO(0, 0, 0, 1),
        padding: EdgeInsets.only(top: 20, bottom: 20),
        icon: widget.iconWidget ?? null,
        label: widget.textWidget,
      ),
    );
  }
}

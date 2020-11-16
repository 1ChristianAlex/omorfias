import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final Function onPressed;
  final Icon iconChild;
  final double padding;

  CircleButton({Key key, this.onPressed, this.iconChild, this.padding = 5})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      child: MaterialButton(
        color: Colors.white,
        shape: CircleBorder(),
        onPressed: onPressed,
        child: Padding(
          padding: EdgeInsets.all(padding * 3),
          child: iconChild,
        ),
      ),
    );
  }
}

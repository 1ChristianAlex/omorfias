import 'package:flutter/material.dart';
import 'package:omorfias/enum/DesignSystem.dart';

class SquaredButton extends StatelessWidget {
  final bool primary;
  final Text textWidget;
  final Function onPress;

  const SquaredButton({Key key, this.primary, this.textWidget, this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DesignSystem.squaredRounded),
          side: BorderSide(
            color: primary ? Colors.black : Colors.white,
          ),
        ),
        onPressed: onPress,
        color: !primary ? Colors.black : Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 47, vertical: 16),
        child: textWidget,
      ),
    );
  }
}

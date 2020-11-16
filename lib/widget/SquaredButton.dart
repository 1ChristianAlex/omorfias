import 'package:flutter/material.dart';
import 'package:omorfias/enum/DesignSystem.dart';

class SquaredButton extends StatelessWidget {
  final bool primary;
  final Text textWidget;
  final Function onPress;
  final bool fullWidth;
  final double paddingX;
  final double paddingY;

  const SquaredButton({
    Key key,
    this.primary,
    this.textWidget,
    this.onPress,
    this.fullWidth = false,
    this.paddingX,
    this.paddingY,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: fullWidth ? double.infinity : 88.0,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DesignSystem.squaredRounded),
          side: BorderSide(
            color: primary ? Colors.black : Colors.white,
          ),
        ),
        onPressed: onPress,
        color: !primary ? Colors.black : Colors.white,
        padding: EdgeInsets.symmetric(
            horizontal: paddingX ?? 47, vertical: paddingY ?? 16),
        child: textWidget,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:omorfias/enum/DesignSystem.dart';
import 'package:omorfias/widget/CardItemShadow.dart';

class CardRadioButton extends StatelessWidget {
  final Widget child;
  final Function onChange;
  final dynamic value;
  final dynamic current;

  CardRadioButton(
      {Key key, this.child, this.onChange, this.value, this.current})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CardItemShadow(
      child: GestureDetector(
        onTap: () {
          onChange(value);
        },
        child: Container(
          padding: EdgeInsets.all(DesignSystem.spacingMargin - 10),
          color: Colors.white,
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: child,
              ),
              Expanded(
                child: Radio(
                  value: value,
                  groupValue: current,
                  onChanged: (valueChange) {
                    onChange(valueChange);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

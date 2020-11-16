import 'package:flutter/material.dart';
import 'package:omorfias/enum/DesignSystem.dart';
import 'package:omorfias/widget/CardItemShadow.dart';

class CardCheckBox extends StatelessWidget {
  final Widget child;
  final Function onChange;
  final bool isSelected;

  CardCheckBox({Key key, this.child, this.onChange, this.isSelected = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CardItemShadow(
      child: GestureDetector(
        onTap: () => {onChange(!isSelected ?? true)},
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
                child: Checkbox(
                  value: isSelected ?? false,
                  onChanged: (checked) => {onChange(checked)},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

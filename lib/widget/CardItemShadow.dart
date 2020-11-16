import 'package:flutter/material.dart';
import 'package:omorfias/enum/DesignSystem.dart';

class CardItemShadow extends StatelessWidget {
  final Widget child;

  CardItemShadow({Key key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: DesignSystem.spacingMargin,
        right: DesignSystem.spacingMargin,
        bottom: DesignSystem.spacingMargin,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(DesignSystem.squaredRounded),
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(204, 204, 204, 1),
            offset: Offset.fromDirection(1, 3),
            blurRadius: 15,
            spreadRadius: 1,
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(DesignSystem.squaredRounded),
        ),
        child: child,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:omorfias/enum/DesignSystem.dart';

class CardStoreItem extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final Color textColor;
  final Color descriptionColor;
  final bool hasShadow;

  const CardStoreItem({
    Key key,
    @required this.title,
    @required this.description,
    @required this.image,
    this.textColor,
    this.descriptionColor,
    this.hasShadow = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widthCard = MediaQuery.of(context).size.width * 0.92;

    return Container(
      margin: EdgeInsets.only(
        left: DesignSystem.spacingMargin,
        right: DesignSystem.spacingMargin,
        bottom: DesignSystem.spacingMargin,
      ),
      width: widthCard,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(DesignSystem.squaredRounded),
        ),
        boxShadow: hasShadow
            ? [
                BoxShadow(
                  color: Color.fromRGBO(204, 204, 204, 1),
                  offset: Offset.fromDirection(1, 3),
                  blurRadius: 15,
                  spreadRadius: 1,
                )
              ]
            : null,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(DesignSystem.squaredRounded),
        ),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: DesignSystem.spacingMargin,
                  right: DesignSystem.spacingMargin,
                  top: DesignSystem.spacingMargin * 0.5,
                  bottom: DesignSystem.spacingMargin * 0.2,
                ),
                width: widthCard,
                decoration: BoxDecoration(
                  color: descriptionColor ?? Colors.white,
                  border: Border(
                    bottom: BorderSide(
                      color: descriptionColor ?? Colors.white,
                    ),
                  ),
                ),
                child: Text(
                  title.toUpperCase(),
                  style: TextStyle(
                    color: textColor ?? Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: DesignSystem.spacingMargin,
                  right: DesignSystem.spacingMargin,
                  top: DesignSystem.spacingMargin * 0.2,
                  bottom: DesignSystem.spacingMargin * 0.5,
                ),
                width: widthCard,
                decoration: BoxDecoration(
                  color: descriptionColor ?? Colors.white,
                  border: Border(
                    top: BorderSide(
                      color: descriptionColor ?? Colors.white,
                    ),
                  ),
                ),
                child: Text(
                  description,
                  style: TextStyle(
                    color: textColor ?? Colors.black,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:omorfias/enum/DesignSystem.dart';
import 'package:omorfias/widget/SquaredButton.dart';
import 'CardStore.dart';

class NewExperiencesSection extends StatelessWidget {
  final bool hasShadow = false;
  final descriptionColor = Color.fromRGBO(45, 52, 54, 1);
  final textColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 40, bottom: 20),
      color: Colors.black,
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(bottom: 10),
            margin: EdgeInsets.symmetric(
              horizontal: DesignSystem.spacingMargin,
            ),
            child: Text(
              'Novas Experiências e Estilos'.toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(bottom: 40),
            margin: EdgeInsets.symmetric(
              horizontal: DesignSystem.spacingMargin,
            ),
            child: Text(
              'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CardStoreItem(
                  textColor: textColor,
                  descriptionColor: descriptionColor,
                  hasShadow: hasShadow,
                  context: context,
                  title: 'Estúdios de Tatuagem',
                  description:
                      'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor',
                  image: 'assets/images/experience-3.jpeg',
                ),
                CardStoreItem(
                  textColor: textColor,
                  descriptionColor: descriptionColor,
                  hasShadow: hasShadow,
                  context: context,
                  title: 'Estúdios de Tatuagem',
                  description:
                      'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor',
                  image: 'assets/images/experience-2.jpeg',
                ),
                CardStoreItem(
                  textColor: textColor,
                  descriptionColor: descriptionColor,
                  hasShadow: hasShadow,
                  context: context,
                  title: 'Estúdios de Tatuagem',
                  description:
                      'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor',
                  image: 'assets/images/experience-1.jpeg',
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: DesignSystem.spacingMargin,
              vertical: 20,
            ),
            alignment: Alignment.centerLeft,
            child: SquaredButton(
              primary: false,
              textWidget: Text(
                'Explorar'.toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

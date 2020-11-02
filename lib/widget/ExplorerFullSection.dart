import 'package:flutter/material.dart';
import 'package:omorfias/enum/DesignSystem.dart';

class ExplorerFullSection extends StatefulWidget {
  @override
  _ExplorerFullSectionState createState() => _ExplorerFullSectionState();
}

class _ExplorerFullSectionState extends State<ExplorerFullSection> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'assets/images/bg-city.jpg',
      child: Container(
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg-city.jpg'), fit: BoxFit.fill),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                vertical: DesignSystem.spacingMargin,
                horizontal: DesignSystem.spacingMargin,
              ),
              child: Text(
                'Novos estilos esperam por você'.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                right: DesignSystem.spacingMargin,
                left: DesignSystem.spacingMargin,
                bottom: DesignSystem.spacingMargin,
              ),
              child: Text(
                'Sentiu vontade de mudar de estilo, e não sabe por onde começar? Explore negócios perto de você e surpreenda-se!',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

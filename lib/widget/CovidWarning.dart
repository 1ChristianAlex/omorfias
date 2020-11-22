import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:omorfias/enum/DesignSystem.dart';

class CovidWarning extends StatelessWidget {
  final double _iconSize = 50;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: DesignSystem.spacingMargin),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 40),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: DesignSystem.spacingMargin),
                  child: Icon(
                    FontAwesomeIcons.headSideMask,
                    size: _iconSize,
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Text(
                      'Use máscara quando não for possível manter o distanciamento físico.',
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 40),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: DesignSystem.spacingMargin),
                  child: Icon(
                    FontAwesomeIcons.houseUser,
                    size: _iconSize,
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Text(
                      'O ideal é permanecer em casa durante o período mais crítico da infecção. Por isso, se você não precisa sair para trabalhar, fique dentro de casa. É fundamental relembrar que durante a quarentena ninguém deve sair à rua sem razão essencial.Fique em casa se você se sentir indisposto.',
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 40),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: DesignSystem.spacingMargin),
                  child: Icon(
                    FontAwesomeIcons.shieldVirus,
                    size: _iconSize,
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Text(
                      'Ligue com antecedência para o plano ou órgão de saúde e peça direcionamento à unidade mais adequada. Isso protege você e evita a propagação de vírus e outras infecções.',
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

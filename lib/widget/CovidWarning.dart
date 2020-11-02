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
                      'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam.',
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
                      'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam.',
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
                      'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam.',
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

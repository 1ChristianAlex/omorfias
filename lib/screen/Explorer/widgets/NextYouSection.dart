import 'package:flutter/material.dart';
import 'package:omorfias/enum/DesignSystem.dart';
import 'package:omorfias/widget/CardStoreEnterprise.dart';

class NextYouSection extends StatelessWidget {
  final int repeatNumber = 10;
  final int widthGrid = 130;
  final int heighGrid = 300;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: DesignSystem.spacingMargin,
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(
              bottom: DesignSystem.spacingMargin,
            ),
            child: Text(
              'Próximos de você'.toUpperCase(),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.55,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return CardStoreEnterprise();
              },
            ),
          ),
        ],
      ),
    );
  }
}

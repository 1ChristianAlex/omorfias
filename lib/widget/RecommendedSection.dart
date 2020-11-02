import 'package:flutter/material.dart';
import 'package:omorfias/enum/DesignSystem.dart';
import 'package:omorfias/widget/MiniProduct.dart';

class RecommendedSection extends StatelessWidget {
  final int repeatNumber = 10;
  final int widthGrid = 130;
  final int heighGrid = 300;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.symmetric(
            horizontal: DesignSystem.spacingMargin,
          ),
          child: Text(
            'Recomendado para você'.toUpperCase(),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: DesignSystem.spacingMargin),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.45,
            child: GridView.count(
              mainAxisSpacing: 40,
              childAspectRatio: (widthGrid / heighGrid),
              scrollDirection: Axis.horizontal,
              crossAxisCount: 3,
              children: List.generate(repeatNumber, (index) => MiniProduct()),
            ),
          ),
        )
      ],
    );
  }
}

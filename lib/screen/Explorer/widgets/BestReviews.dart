import 'package:flutter/material.dart';
import 'package:omorfias/enum/DesignSystem.dart';
import 'package:omorfias/model/enterprise.dart';
import 'package:omorfias/service/Products/EnterpriseService.dart';
import 'package:omorfias/widget/MiniProductReview.dart';

class BestReviews extends StatelessWidget {
  final int repeatNumber = 10;
  final int widthGrid = 130;
  final int heighGrid = 300;

  Future<List<Enterprise>> getBestReview() async {
    var serviceEnterprise = EnterpriseService();

    var list = await serviceEnterprise.getNextToYou();
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(
            left: DesignSystem.spacingMargin,
            right: DesignSystem.spacingMargin,
            bottom: DesignSystem.spacingMargin,
          ),
          child: Text(
            'Melhor Avaliados'.toUpperCase(),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        FutureBuilder(
            future: getBestReview(),
            builder: (
              BuildContext context,
              AsyncSnapshot<List<Enterprise>> snapshot,
            ) {
              if (snapshot.hasData) {
                var enterpriseList = snapshot.data;
                return Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: DesignSystem.spacingMargin),
                  child: SizedBox(
                    height: 390,
                    child: GridView.count(
                      mainAxisSpacing: 40,
                      childAspectRatio: (widthGrid / heighGrid),
                      scrollDirection: Axis.horizontal,
                      crossAxisCount: 3,
                      children: List.generate(
                        enterpriseList.length,
                        (index) => MiniProductReview(
                          enterprise: enterpriseList[index],
                        ),
                      ),
                    ),
                  ),
                );
              }
              return Container();
            })
      ],
    );
  }
}

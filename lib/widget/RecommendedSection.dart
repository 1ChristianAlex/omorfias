import 'package:flutter/material.dart';
import 'package:omorfias/enum/DesignSystem.dart';
import 'package:omorfias/model/serviceProduct.dart';
import 'package:omorfias/service/Products/EnterpriseService.dart';
import 'package:omorfias/widget/MiniProduct.dart';

class RecommendedSection extends StatelessWidget {
  final int repeatNumber = 10;
  final int widthGrid = 130;
  final int heighGrid = 300;

  Future<List<ServiceProduct>> getRecommended() async {
    var service = EnterpriseService();

    var listEnterprise = await service.getRecommendedForYou();

    return listEnterprise;
  }

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
            child: FutureBuilder(
                future: getRecommended(),
                builder: (
                  BuildContext context,
                  AsyncSnapshot<List<ServiceProduct>> snapshot,
                ) {
                  if (snapshot.hasData) {
                    return GridView.count(
                      mainAxisSpacing: 40,
                      childAspectRatio: (widthGrid / heighGrid),
                      scrollDirection: Axis.horizontal,
                      crossAxisCount: 3,
                      children: List.generate(
                        snapshot.data.length,
                        (index) => MiniProduct(
                          product: snapshot.data[index],
                        ),
                      ),
                    );
                  }
                  return Container();
                }),
          ),
        )
      ],
    );
  }
}

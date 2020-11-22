import 'package:flutter/material.dart';
import 'package:omorfias/enum/DesignSystem.dart';
import 'package:omorfias/model/enterprise.dart';
import 'package:omorfias/service/Products/EnterpriseService.dart';
import 'package:omorfias/screen/Explorer/widgets/CardStoreEnterprise.dart';

class NextYouSection extends StatefulWidget {
  @override
  _NextYouSectionState createState() => _NextYouSectionState();
}

class _NextYouSectionState extends State<NextYouSection> {
  Future<List<Enterprise>> getNextToYou() async {
    var serviceEnterprise = EnterpriseService();

    var list = await serviceEnterprise.getNextToYou();
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: DesignSystem.spacingMargin,
      ),
      child: FutureBuilder(
          future: getNextToYou(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Enterprise>> snapshot) {
            if (snapshot.hasData) {
              return Column(
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
                    height: 400,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return CardStoreEnterprise(
                          enterpriseItem: snapshot.data[index],
                        );
                      },
                    ),
                  ),
                ],
              );
            }
            return Container();
          }),
    );
  }
}

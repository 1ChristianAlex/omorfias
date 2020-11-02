import 'package:flutter/material.dart';
import 'package:omorfias/widget/BestReviews.dart';
import 'package:omorfias/widget/BottomBar.dart';
import 'package:omorfias/widget/CardsCategorieSection.dart';
import 'package:omorfias/widget/CovidWarning.dart';
import 'package:omorfias/widget/ExplorerFullSection.dart';
import 'package:omorfias/widget/FlatSearchBar.dart';
import 'package:omorfias/widget/NextYouSection.dart';
import 'package:omorfias/widget/PopButton.dart';
import 'package:omorfias/widget/RecommendedSection.dart';

class ExplorerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  child: ExplorerFullSection(),
                  margin: EdgeInsets.only(bottom: 40),
                ),
                Positioned(
                  child: PopButton(),
                  top: 32,
                ),
                Positioned(
                  child: FlatSearchBar(),
                  top: 35,
                  right: 9,
                ),
              ],
            ),
            Container(
              child: BestReviews(),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 40, top: 40),
              child: CardsStoreSection(),
            ),
            Container(
              child: NextYouSection(),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 40),
              child: RecommendedSection(),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 40),
              child: CovidWarning(),
            )
          ],
        ),
      ),
    );
  }
}

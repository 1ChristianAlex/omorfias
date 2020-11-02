import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:omorfias/model/user.dart';
import 'package:omorfias/redux/appState.dart';
import 'package:omorfias/widget/ExplorerSection.dart';
import 'package:omorfias/widget/BottomBar.dart';
import 'package:omorfias/widget/HorizontalCardScroll.dart';
import 'package:omorfias/widget/CardsStoreSection.dart';
import 'package:omorfias/widget/NewExperienceSection.dart';
import 'package:omorfias/widget/RecommendedSection.dart';
import 'package:omorfias/widget/SearchBar.dart';
import 'package:redux/redux.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, User>(
      distinct: true,
      converter: (Store<AppState> store) => store.state.user,
      builder: (context, user) {
        return Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: BottomBar(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 50, bottom: 40),
                  child: OmorfiasSearchBar(),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: ExplorerSection(),
                ),
                Container(
                  child: CardsStoreSection(),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 40),
                  child: NewExperiencesSection(),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 40),
                  child: RecommendedSection(),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

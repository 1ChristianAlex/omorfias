import 'package:flutter/material.dart';
import 'package:omorfias/enum/DesignSystem.dart';
import 'package:omorfias/service/Auth/Auth.dart';
import 'package:omorfias/widget/SquaredButton.dart';

class BannerExplorar extends StatelessWidget {
  void logout() {
    AuthService _authService = AuthService();
    _authService.logout();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: DesignSystem.spacingMargin),
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(DesignSystem.squaredRounded),
        ),
        image: DecorationImage(
            image: AssetImage('assets/images/bg-city.jpg'), fit: BoxFit.fill),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              vertical: DesignSystem.spacingMargin,
              horizontal: DesignSystem.spacingMargin,
            ),
            child: Text(
              'Descubra negócios incríveis perto de você'.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
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
          SquaredButton(
            onPress: logout,
            primary: true,
            textWidget: Text(
              'Explorar'.toUpperCase(),
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}

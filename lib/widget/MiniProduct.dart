import 'package:flutter/material.dart';
import 'package:omorfias/enum/DesignSystem.dart';
import 'package:omorfias/utils/Currency.dart';

class MiniProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(DesignSystem.squaredRounded),
              ),
              child: Image(
                image: AssetImage('assets/images/recommended-1.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.only(left: 18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text(
                      'Corte e Barba',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    child: Text(Currency.doubleToCurrency(25.66)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

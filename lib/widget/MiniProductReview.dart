import 'package:flutter/material.dart';
import 'package:omorfias/enum/DesignSystem.dart';
import 'package:omorfias/model/enterprise.dart';
import 'package:omorfias/utils/ScreenArguments.dart';

class MiniProductReview extends StatelessWidget {
  final Enterprise enterprise;

  MiniProductReview({Key key, this.enterprise}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: GestureDetector(
        onTap: () {
          Map<String, int> arguments = Map();
          arguments['enterpriseId'] = enterprise.id;
          Navigator.pushNamed(
            context,
            '/enterprise/view',
            arguments: ScreenArguments(arguments),
          );
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(DesignSystem.squaredRounded),
                ),
                child: Image(
                  image: NetworkImage(enterprise.urlImage),
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
                        enterprise.name.toUpperCase(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      child: Text(enterprise.description),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 20,
                            color: Colors.blue,
                          ),
                          Text(enterprise.evaluation.toStringAsFixed(2))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:omorfias/enum/DesignSystem.dart';

class EnterpriseDescription extends StatelessWidget {
  final String name;
  final String description;
  final int review;
  final String address;

  EnterpriseDescription({
    Key key,
    this.name,
    this.description,
    this.review,
    this.address,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: DesignSystem.spacingMargin,
        vertical: 20,
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Text(
              (name).toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Text(
              description,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          Container(
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.blue,
                ),
                Text(review.toStringAsFixed(2)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    '.',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                ),
                Text(address ?? 'Rua José Pedro, 40, Ibirité, MG'),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:omorfias/enum/DesignSystem.dart';
import 'package:omorfias/model/enterprise.dart';

class CardStoreEnterprise extends StatefulWidget {
  final Enterprise enterpriseItem;

  CardStoreEnterprise({Key key, @required this.enterpriseItem})
      : super(key: key);

  @override
  _CardStoreEnterpriseState createState() => _CardStoreEnterpriseState();
}

class _CardStoreEnterpriseState extends State<CardStoreEnterprise> {
  bool _isFavorite = false;

  void setFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    var enterpriseItem = widget.enterpriseItem;
    var avarage =
        List.generate(enterpriseItem.averageValue, (index) => '\$').join('');
    return Container(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            margin: EdgeInsets.only(right: DesignSystem.spacingMargin),
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(DesignSystem.squaredRounded),
              ),
              child: Stack(
                children: [
                  Container(
                    child: Image(
                      image: NetworkImage(enterpriseItem.urlImage),
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height * 0.35,
                    ),
                  ),
                  Positioned(
                    left: 18,
                    top: 18,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(DesignSystem.squaredRounded / 3),
                        ),
                      ),
                      child: Text(
                        'Premium'.toUpperCase(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 3,
                    top: 18,
                    child: Container(
                      child: MaterialButton(
                        color: Colors.white,
                        shape: CircleBorder(),
                        onPressed: setFavorite,
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Icon(
                            _isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            margin: EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  size: 20,
                  color: Colors.blue,
                ),
                Text(enterpriseItem.evaluation.toStringAsFixed(2))
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            margin: EdgeInsets.only(bottom: 8),
            child: Text(
              enterpriseItem.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            margin: EdgeInsets.only(bottom: 8),
            child: Text(
              enterpriseItem.category,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            margin: EdgeInsets.only(bottom: 8),
            child: Text(
              'Média de valor: $avarage',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

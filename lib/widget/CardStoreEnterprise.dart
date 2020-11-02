import 'package:flutter/material.dart';
import 'package:omorfias/enum/DesignSystem.dart';

class CardStoreEnterprise extends StatefulWidget {
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
                      image: AssetImage('assets/images/experience-3.jpeg'),
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
                Text('5.0 (217)')
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            margin: EdgeInsets.only(bottom: 8),
            child: Text(
              'Salão e Barbearia - Black Panter',
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
              'Salão e Barbearia',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            margin: EdgeInsets.only(bottom: 8),
            child: Text(
              'Média de valor: \$\$',
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

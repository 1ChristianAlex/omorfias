import 'package:flutter/material.dart';
import 'package:omorfias/enum/DesignSystem.dart';

class ListCardStore extends StatefulWidget {
  @override
  _ListCardStoreState createState() => _ListCardStoreState();
}

class _ListCardStoreState extends State<ListCardStore> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.35,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          cardStore(
            'Estúdios de Tatuagem',
            'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor',
            'assets/images/tatoo-store.jpg',
          ),
          cardStore(
            'Estúdios de Tatuagem',
            'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor',
            'assets/images/hair-store.jpg',
          ),
          cardStore(
            'Estúdios de Tatuagem',
            'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor',
            'assets/images/barber-store.jpg',
          ),
        ],
      ),
    );
  }

  Container cardStore(
    String title,
    String description,
    String image,
  ) {
    final widthCard = MediaQuery.of(context).size.width * 0.92;

    return Container(
      margin: EdgeInsets.only(
        left: DesignSystem.spacingMargin,
        right: DesignSystem.spacingMargin,
        bottom: DesignSystem.spacingMargin,
      ),
      width: widthCard,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(DesignSystem.squaredRounded),
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(204, 204, 204, 1),
            offset: Offset.fromDirection(1, 3),
            blurRadius: 15,
            spreadRadius: 1,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(DesignSystem.squaredRounded),
        ),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: DesignSystem.spacingMargin,
                  right: DesignSystem.spacingMargin,
                  top: DesignSystem.spacingMargin * 0.5,
                  bottom: DesignSystem.spacingMargin * 0.2,
                ),
                width: widthCard,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                ),
                child: Text(
                  title.toUpperCase(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: DesignSystem.spacingMargin,
                  right: DesignSystem.spacingMargin,
                  top: DesignSystem.spacingMargin * 0.2,
                  bottom: DesignSystem.spacingMargin * 0.5,
                ),
                width: widthCard,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                ),
                child: Text(
                  description,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

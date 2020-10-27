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
      height: 150,
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
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(DesignSystem.squaredRounded),
        ),
      ),
      child: Column(
        children: [Text(title), Text(description)],
      ),
    );
  }
}

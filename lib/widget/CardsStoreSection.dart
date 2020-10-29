import 'package:flutter/material.dart';
import 'CardStore.dart';

class CardsStoreSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.35,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          CardStoreItem(
              context: context,
              title: 'Estúdios de Tatuagem',
              description:
                  'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor',
              image: 'assets/images/tatoo-store.jpg'),
          CardStoreItem(
              context: context,
              title: 'Estúdios de Tatuagem',
              description:
                  'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor',
              image: 'assets/images/hair-store.jpg'),
          CardStoreItem(
              context: context,
              title: 'Estúdios de Tatuagem',
              description:
                  'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor',
              image: 'assets/images/barber-store.jpg'),
        ],
      ),
    );
  }
}

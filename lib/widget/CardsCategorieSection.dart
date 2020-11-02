import 'package:flutter/material.dart';
import 'CardStoreCategorie.dart';

class CardsStoreSection extends StatelessWidget {
  final List<Map<String, String>> _mockListCards = [
    {
      'title': 'Estúdios de Tatuagem',
      'description':
          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor',
      'image': 'assets/images/tatoo-store.jpg'
    },
    {
      'title': 'Estúdios de Tatuagem',
      'description':
          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor',
      'image': 'assets/images/hair-store.jpg'
    },
    {
      'title': 'Estúdios de Barbearia',
      'description':
          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor',
      'image': 'assets/images/barber-store.jpg'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.35,
      child: ListView.builder(
        itemCount: _mockListCards.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final itemCard = _mockListCards[index];
          return CardStoreItem(
            title: itemCard['title'],
            description: itemCard['description'],
            image: itemCard['image'],
          );
        },
      ),
    );
  }
}

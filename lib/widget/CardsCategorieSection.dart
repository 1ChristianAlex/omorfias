import 'package:flutter/material.dart';
import 'CardStoreCategorie.dart';

class CardsStoreSection extends StatelessWidget {
  final List<Map<String, String>> _mockListCards = [
    {
      'title': 'Estúdios de Tatuagem',
      'description':
          'Encontre o seu estilo de tatuagem, com o tatuador que mais te agrade.',
      'image': 'assets/images/tatoo-store.jpg'
    },
    {
      'title': 'Estúdios de beleza',
      'description':
          'Dê um momento para cuidar da beleza! Encontre a pessoa mais qualificada para sua beleza.',
      'image': 'assets/images/hair-store.jpg'
    },
    {
      'title': 'Barbearia',
      'description':
          'Cabelo na regua ou não, conheça nossos profissionais e escolha o especialista para você!',
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

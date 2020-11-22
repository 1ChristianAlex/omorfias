import 'package:flutter/material.dart';
import 'package:omorfias/enum/DesignSystem.dart';
import 'package:omorfias/widget/SquaredButton.dart';
import '../../../widget/CardStoreCategorie.dart';

class NewExperiencesSection extends StatelessWidget {
  final bool hasShadow = false;
  final descriptionColor = Color.fromRGBO(45, 52, 54, 1);
  final textColor = Colors.white;

  List<Map<String, dynamic>> mockNewExperienceCards() {
    return [
      {
        'textColor': textColor,
        'descriptionColor': descriptionColor,
        'hasShadow': hasShadow,
        'title': 'Barbearia',
        'description':
            'Cabelo na regua ou não, conheça nossos profissionais e escolha o especialista para você!',
        'image': 'assets/images/experience-3.jpeg',
      },
      {
        'textColor': textColor,
        'descriptionColor': descriptionColor,
        'hasShadow': hasShadow,
        'title': 'Clinica de estética',
        'description':
            'Não so sua pele, mas você por inteiro merece ser bem cuidada (o). Encontre aqui a clinica de estetica perfeita para você. ',
        'image': 'assets/images/experience-2.jpeg',
      },
      {
        'textColor': textColor,
        'descriptionColor': descriptionColor,
        'hasShadow': hasShadow,
        'title': 'Estúdio de tatuagem',
        'description':
            'Encontre o seu estilo de tatuagem, com o tatuador que mais te agrade.',
        'image': 'assets/images/experience-1.jpeg',
      }
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 40, bottom: 20),
      color: Colors.black,
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(bottom: 10),
            margin: EdgeInsets.symmetric(
              horizontal: DesignSystem.spacingMargin,
            ),
            child: Text(
              'Novas Experiências e Estilos'.toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(bottom: 40),
            margin: EdgeInsets.symmetric(
              horizontal: DesignSystem.spacingMargin,
            ),
            child: Text(
              'Descubra novos estilos, observe, experimente e aplique! Não se limite a padrões de beleza, nos te ajudamos a encontrar o seu estilo.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: mockNewExperienceCards().length,
              itemBuilder: (context, index) {
                final itemCard = mockNewExperienceCards()[index];
                return CardStoreItem(
                  title: itemCard['title'],
                  description: itemCard['description'],
                  image: itemCard['image'],
                  descriptionColor: itemCard['descriptionColor'],
                  hasShadow: itemCard['hasShadow'],
                  textColor: itemCard['textColor'],
                );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: DesignSystem.spacingMargin,
              vertical: 20,
            ),
            alignment: Alignment.centerLeft,
            child: SquaredButton(
              primary: false,
              textWidget: Text(
                'Explorar'.toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

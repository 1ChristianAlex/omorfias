import 'package:flutter/material.dart';
import 'package:omorfias/enum/DesignSystem.dart';

class AvaibleHours extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Horários',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 50),
        child: Center(
          child: Column(
            children: [
              Container(
                child: Text(
                  'Disbonilidade de horário'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: DesignSystem.spacingMargin,
                        vertical: 20,
                      ),
                      child: Row(
                        children: [
                          Expanded(child: Text('Segunda-Feira')),
                          Expanded(
                              child: Text(
                            'Fechado',
                            textAlign: TextAlign.right,
                          ))
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: DesignSystem.spacingMargin,
                        vertical: 20,
                      ),
                      child: Row(
                        children: [
                          Expanded(child: Text('Terça-Feira')),
                          Expanded(
                              child: Text(
                            '09:00 as 22:00',
                            textAlign: TextAlign.right,
                          ))
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: DesignSystem.spacingMargin,
                        vertical: 20,
                      ),
                      child: Row(
                        children: [
                          Expanded(child: Text('Quarta-Feira')),
                          Expanded(
                              child: Text(
                            '09:00 as 22:00',
                            textAlign: TextAlign.right,
                          ))
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: DesignSystem.spacingMargin,
                        vertical: 20,
                      ),
                      child: Row(
                        children: [
                          Expanded(child: Text('Quinta-Feira')),
                          Expanded(
                              child: Text(
                            '09:00 as 22:00',
                            textAlign: TextAlign.right,
                          ))
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: DesignSystem.spacingMargin,
                        vertical: 20,
                      ),
                      child: Row(
                        children: [
                          Expanded(child: Text('Sexta-Feira')),
                          Expanded(
                              child: Text(
                            '09:00 as 22:00',
                            textAlign: TextAlign.right,
                          ))
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: DesignSystem.spacingMargin,
                        vertical: 20,
                      ),
                      child: Row(
                        children: [
                          Expanded(child: Text('Sabádo')),
                          Expanded(
                              child: Text(
                            '09:00 as 20:00',
                            textAlign: TextAlign.right,
                          ))
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: DesignSystem.spacingMargin,
                        vertical: 20,
                      ),
                      child: Row(
                        children: [
                          Expanded(child: Text('Domingo')),
                          Expanded(
                              child: Text(
                            '10:00 as 14:00',
                            textAlign: TextAlign.right,
                          ))
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

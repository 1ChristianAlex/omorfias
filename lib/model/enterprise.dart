import 'package:omorfias/enum/CategoryEnum.dart';

class Enterprise {
  final int id;
  final String name;
  final int evaluation;
  final String description;
  final int telephone;
  final DateTime startDate;
  final DateTime endDate;
  final int averageValue;
  final int cnpj;
  final int cpf;
  final String category;
  final String urlImage;

  Enterprise({
    this.id,
    this.name,
    this.evaluation,
    this.description,
    this.telephone,
    this.startDate,
    this.endDate,
    this.averageValue,
    this.cnpj,
    this.cpf,
    this.category,
    this.urlImage,
  });

  factory Enterprise.fromJson(dynamic json) {
    return Enterprise(
      id: json['id'],
      name: json['name'],
      evaluation: json['evaluation'],
      description: json['description'],
      telephone: json['telephone'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      averageValue: json['averageValue'],
      cnpj: json['cnpj'],
      cpf: json['cpf'],
      category: getCaregoryName(json['category']),
      urlImage: json['urlImage'].toString().trim(),
    );
  }
}

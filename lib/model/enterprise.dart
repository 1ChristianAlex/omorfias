import 'package:omorfias/enum/CategoryEnum.dart';
import 'package:omorfias/model/serviceProduct.dart';

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
  final List<ServiceProduct> services;

  Enterprise({
    this.id,
    this.services,
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
    List<ServiceProduct> services = List<ServiceProduct>();
    json['services'].forEach((serviceItem) {
      services.add(ServiceProduct.fromJson(serviceItem));
    });
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
      services: services,
    );
  }
}

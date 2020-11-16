import 'package:omorfias/model/enterprise.dart';
import 'package:omorfias/model/serviceProduct.dart';

abstract class IEnterpriseService {
  Future<List<Enterprise>> getBetterRated();
  Future<List<Enterprise>> getNextToYou();
  Future<List<ServiceProduct>> getRecommendedForYou();
  Future<Enterprise> getEnterprise(int id);
}

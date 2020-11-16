import 'package:http/http.dart';
import 'package:omorfias/model/enterprise.dart';
import 'package:omorfias/model/serviceProduct.dart';
import 'package:omorfias/service/Adapter/Adapter.dart';

import 'IEnterpriseService.dart';

const GET_BETTER_RATED = '/UserPage/obtain/GetBetterRated';
const GET_NEXT_TO_YOU = '/UserPage/obtain/NextToYou';
const GET_RECOMMENDED_FOR_YOU = '/UserPage/obtain/RecommendedForYou';
const GET_ENTERPRISE = '/UserPage/obtain/GetEnterprise/';

class EnterpriseService implements IEnterpriseService {
  Adapter _adapter;

  EnterpriseService() {
    this._adapter = Adapter(Client());
  }

  @override
  Future<List<Enterprise>> getBetterRated() async {
    final response = await _adapter.getMethod(GET_BETTER_RATED);

    var listEnterpriseJson = List.from(response['entity']);

    List<Enterprise> listEnterprise =
        listEnterpriseJson.map((json) => Enterprise.fromJson(json));

    return listEnterprise;
  }

  @override
  Future<List<Enterprise>> getNextToYou() async {
    final response = await _adapter.getMethod(GET_NEXT_TO_YOU);

    var listEnterpriseJson = List.from(response['entity']);

    List<Enterprise> listEnterprise = List<Enterprise>();

    listEnterpriseJson
        .forEach((json) => listEnterprise.add(Enterprise.fromJson(json)));

    return listEnterprise;
  }

  @override
  Future<List<ServiceProduct>> getRecommendedForYou() async {
    final response = await _adapter.getMethod(GET_RECOMMENDED_FOR_YOU);

    var listEnterpriseJson = List.from(response['entity']);

    List<ServiceProduct> listEnterprise = List<ServiceProduct>();

    listEnterpriseJson
        .forEach((json) => listEnterprise.add(ServiceProduct.fromJson(json)));

    return listEnterprise;
  }

  @override
  Future<Enterprise> getEnterprise(int id) async {
    final response = await _adapter.getMethod("$GET_ENTERPRISE$id");

    Enterprise listEnterprise = Enterprise.fromJson(response['entity']);

    return listEnterprise;
  }
}

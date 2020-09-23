import 'dart:convert';
import 'package:http/http.dart';

abstract class IAdapter {
  Future getMethod(String url);
  Future postMethod(String url, dynamic body);
  Future putMethod(String url, dynamic body);
  Future deleteMethod(String url, dynamic body);
}

class Adapter implements IAdapter {
  Client _clientHttp;

  Adapter(this._clientHttp);

  Future getMethod(String url) async {
    Response response = await this._clientHttp.get(url);
    return json.decode(response.body);
  }

  Future postMethod(String url, body) async {
    Response response = await this._clientHttp.post(url);
    return json.decode(response.body);
  }

  Future putMethod(String url, body) async {
    Response response = await this._clientHttp.put(url);
    return json.decode(response.body);
  }

  Future deleteMethod(String url, body) async {
    Response response = await this._clientHttp.delete(url);
    return json.decode(response.body);
  }
}

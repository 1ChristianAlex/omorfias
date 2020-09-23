import 'dart:convert';
import 'package:http/http.dart';
import 'package:omorfias/config/SecureStorage.dart';

abstract class IAdapter {
  Future getMethod(String url);
  Future postMethod(String url, dynamic body);
  Future putMethod(String url, dynamic body);
  Future deleteMethod(String url, dynamic body);
}

class DefaultHeader {
  Map<String, String> _headers = Map<String, String>();

  void _loadHeader() async {
    SecureStorage secureStorage = SecureStorage();

    String token = await secureStorage.getToken();

    if (token.isNotEmpty) {
      this._headers['Authentication'] = token;
    }
  }

  DefaultHeader() {
    _loadHeader();
  }

  Map<String, String> get getHeader {
    _loadHeader();

    return _headers;
  }
}

class Adapter implements IAdapter {
  Client _clientHttp;
  DefaultHeader header = DefaultHeader();

  Adapter(this._clientHttp);

  Future getMethod(String url) async {
    Response response =
        await this._clientHttp.get(url, headers: header.getHeader);
    return json.decode(response.body);
  }

  Future postMethod(String url, body) async {
    Response response =
        await this._clientHttp.post(url, headers: header.getHeader, body: body);
    return json.decode(response.body);
  }

  Future putMethod(String url, body) async {
    Response response =
        await this._clientHttp.put(url, headers: header.getHeader, body: body);
    return json.decode(response.body);
  }

  Future deleteMethod(String url, body) async {
    Response response =
        await this._clientHttp.delete(url, headers: header.getHeader);
    return json.decode(response.body);
  }
}

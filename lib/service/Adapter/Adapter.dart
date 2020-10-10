import 'dart:convert';
import 'package:http/http.dart';
import 'package:omorfias/config/SecureStorage.dart';
import 'IAdapter.dart';

class DefaultHeader {
  Map<String, String> _headers = Map<String, String>();

  Future<void> _loadHeader() async {
    SecureStorage secureStorage = SecureStorage();
    await secureStorage.setValue('token', 'value');
    String token = await secureStorage.getToken();

    if (token.isNotEmpty) {
      this._headers['Authentication'] = token;
    }
  }

  Future<void> getHeader(Map<String, String> header) async {
    await _loadHeader();
    header.addAll(_headers);
  }
}

class Adapter implements IAdapter {
  Client _clientHttp;
  DefaultHeader _defaultHeader = DefaultHeader();
  String baseUrl;

  Adapter(this._clientHttp, {this.baseUrl}) {
    this.baseUrl = 'http://localhost:5000';
  }

  Future<void> _decorateHeader(Map<String, String> headers) async {
    if (headers.length > 0) {
      await _defaultHeader.getHeader(headers);
    }
  }

  Future getMethod(String url, {Map<String, String> headers}) async {
    await _decorateHeader(headers);

    Response response = await this._clientHttp.get(url, headers: headers);
    return json.decode(response.body);
  }

  Future postMethod(String url, body, {Map<String, String> headers}) async {
    await _decorateHeader(headers);

    Response response =
        await this._clientHttp.post(url, headers: headers, body: body);
    return json.decode(response.body);
  }

  Future putMethod(String url, body, {Map<String, String> headers}) async {
    await _decorateHeader(headers);

    Response response =
        await this._clientHttp.put(url, headers: headers, body: body);
    return json.decode(response.body);
  }

  Future deleteMethod(String url, body, {Map<String, String> headers}) async {
    await _decorateHeader(headers);

    Response response = await this._clientHttp.delete(url, headers: headers);
    return json.decode(response.body);
  }
}

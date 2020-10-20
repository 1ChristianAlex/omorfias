import 'dart:convert';
import 'package:http/http.dart';
import 'package:omorfias/config/SecureStorage.dart';
import 'IAdapter.dart';

class DefaultHeader {
  Map<String, String> _headers = Map<String, String>();

  Future<void> _loadHeader() async {
    SecureStorage secureStorage = SecureStorage();
    String token = await secureStorage.getToken();

    if (token != null && token.isNotEmpty) {
      this._headers['Authentication'] = token;
    }

    this._headers['Content-Type'] = 'application/json';
  }

  Future<Map<String, String>> getHeader(Map<String, String> header) async {
    await _loadHeader();
    _headers.addAll(header);
    return _headers;
  }
}

class Adapter implements IAdapter {
  Client _clientHttp;
  DefaultHeader _defaultHeader = DefaultHeader();
  String baseUrl;

  Adapter(this._clientHttp, {this.baseUrl}) {
    this.baseUrl = 'http://192.168.0.109:5000';
  }

  String _decorateUrl(String url) => '${this.baseUrl}$url';

  String _decorateBody(dynamic body) => jsonEncode(body);

  Future<Map<String, String>> _decorateHeader(
      Map<String, String> headers) async {
    if (headers == null) {
      headers = new Map<String, String>();
    }

    return await _defaultHeader.getHeader(headers);
  }

  Future getMethod(String url, {Map<String, String> headers}) async {
    headers = await _decorateHeader(headers);
    url = this._decorateUrl(url);

    Response response = await this._clientHttp.get(url, headers: headers);
    return json.decode(response.body);
  }

  Future postMethod(String url, body, {Map<String, String> headers}) async {
    body = _decorateBody(body);
    headers = await _decorateHeader(headers);
    url = this._decorateUrl(url);

    Response response =
        await this._clientHttp.post(url, headers: headers, body: body);
    return json.decode(response.body);
  }

  Future putMethod(String url, body, {Map<String, String> headers}) async {
    body = _decorateBody(body);
    headers = await _decorateHeader(headers);
    url = this._decorateUrl(url);

    Response response =
        await this._clientHttp.put(url, headers: headers, body: body);
    return json.decode(response.body);
  }

  Future deleteMethod(String url, body, {Map<String, String> headers}) async {
    body = _decorateBody(body);
    headers = await _decorateHeader(headers);
    url = this._decorateUrl(url);

    Response response = await this._clientHttp.delete(url, headers: headers);
    return json.decode(response.body);
  }
}

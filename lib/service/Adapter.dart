import 'dart:convert';
import 'package:http/http.dart';
import 'package:omorfias/config/SecureStorage.dart';

abstract class IAdapter {
  Future getMethod(String url, {Map<String, String> headers});
  Future postMethod(String url, dynamic body, {Map<String, String> headers});
  Future putMethod(String url, dynamic body, {Map<String, String> headers});
  Future deleteMethod(String url, dynamic body, {Map<String, String> headers});
}

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

  Future<Map<String, String>> getHeader() async {
    await _loadHeader();

    return _headers;
  }
}

class Adapter implements IAdapter {
  Client _clientHttp;
  DefaultHeader header = DefaultHeader();

  Adapter(this._clientHttp);

  Future<Map<String, String>> mergeHeaders(Map<String, String> headers) async {
    Map<String, String> headerRequest = Map<String, String>();
    headerRequest.addAll(headers);
    headerRequest.addAll(await header.getHeader());
    return headerRequest;
  }

  Future getMethod(String url, {Map<String, String> headers}) async {
    Map<String, String> headerRequest = await mergeHeaders(headers);

    Response response = await this._clientHttp.get(url, headers: headerRequest);
    return json.decode(response.body);
  }

  Future postMethod(String url, body, {Map<String, String> headers}) async {
    Map<String, String> headerRequest = await mergeHeaders(headers);

    Response response =
        await this._clientHttp.post(url, headers: headerRequest, body: body);
    return json.decode(response.body);
  }

  Future putMethod(String url, body, {Map<String, String> headers}) async {
    Map<String, String> headerRequest = await mergeHeaders(headers);

    Response response =
        await this._clientHttp.put(url, headers: headerRequest, body: body);
    return json.decode(response.body);
  }

  Future deleteMethod(String url, body, {Map<String, String> headers}) async {
    Map<String, String> headerRequest = await mergeHeaders(headers);

    Response response =
        await this._clientHttp.delete(url, headers: headerRequest);
    return json.decode(response.body);
  }
}

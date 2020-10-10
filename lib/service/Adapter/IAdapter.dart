abstract class IAdapter {
  Future getMethod(String url, {Map<String, String> headers});
  Future postMethod(String url, dynamic body, {Map<String, String> headers});
  Future putMethod(String url, dynamic body, {Map<String, String> headers});
  Future deleteMethod(String url, dynamic body, {Map<String, String> headers});
}

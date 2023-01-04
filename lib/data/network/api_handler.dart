part of 'api.dart';

abstract class ApiHandler {
  Future get(String url, String token);
  Future post(String url, dynamic body, String token);
  Future put(String url, dynamic body);
  Future delete(String url);
  factory ApiHandler() => _ApiHandlerImpl();
}

class _ApiHandlerImpl implements ApiHandler {

  @override
  Future get(String url, token) async {
    final ioc = HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = IOClient(ioc);

    try {

      final response = await http.get(Uri.parse(url), headers: {
        "Authorization": "Bearer $token",
        "Accept": "application/json",
      });
      print("url: "+url);
      print("headers: "+{
        "Authorization": "Bearer $token",
        "Accept": "application/json",
      }.toString());
      print(response.body.toString());
      return _process(response);
    } catch (e) {
      print("catch "+e.toString());
    }
  }

  @override
  Future post(String url, body, token) async {
    final ioc = HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = IOClient(ioc);

    try {
      final response = await http.post(Uri.parse(url),
          headers: {
            "Authorization": "Bearer $token",
            "Accept": "application/json",
          },
          body: body);
      print("url: "+url);
      print("headers: "+{
        "Authorization": "Bearer $token",
        "Accept": "application/json",
      }.toString());
      print("body: "+body.toString());
      print("response: "+response.body.toString());
      return _process(response);
    } catch (e) {
      print("catch "+e.toString());
    }
  }

  @override
  Future put(String url, body) async {
    try {
      final response = await http.put(Uri.parse(url), body: body);
      return _process(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  @override
  Future delete(String url) async {
    try {
      final response = await http.delete(Uri.parse(url));
      return _process(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  dynamic _process(http.Response response) {
    switch (response.statusCode) {
      case 422:
      case 200:
      case 400:
      case 401:
      case 403:
      case 404:
        return json.decode(response.body);
      case 500:
      default:
        return FetchDataException(
          'Error occured while connecting to server with StatusCode : ${response.statusCode}',
        );
    }
  }
}

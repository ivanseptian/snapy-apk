import 'dart:convert';
import 'dart:io';

import 'package:http/io_client.dart';
import 'package:markaz_snappy/models/login_model.dart';
import '../../data/network/api.dart';

class LoginScreenService {

  Future<login_model?> loginUser(String email, String password) async {
    var res = await Api.loginUser(email, password);
    try {
      login_model dataJson;
      dataJson = login_model.fromJson(res);

      return dataJson;
    } catch (e) {
      print("loginUser: "+e.toString());
      return null;
    }
  }

  Future postLogin(String url, body, token) async {
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
      switch (response.statusCode) {
        case 200:
        case 400:
        case 401:
          return response.statusCode;
        case 403:
        case 404:
          return json.decode(response.body);
        case 500:
        default:
          return FetchDataException(
            'Error occured while connecting to server with StatusCode : ${response.statusCode}',
          );
      }
    } catch (e) {
      print("catch "+e.toString());
    }
  }

}
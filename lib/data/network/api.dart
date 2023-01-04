import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:markaz_snappy/config/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'api_constant.dart';
part 'api_exception.dart';
part 'api_handler.dart';

class Api {
  static final ApiHandler _handler = ApiHandler();

  static Future registerUser(String name, String LoginEmail, String password,
      String LoginPhone) async {

    return await _handler.post(ApiUrl.registerUrl, {
      'name': name,
      'LoginEmail': LoginEmail,
      'password': password,
      'LoginPhone': LoginPhone
    }, "");
  }

  static Future test() async {

    return await _handler.get("https://dummyjson.com/products/1", "");
  }

  static Future loginUser(String LoginEmail, String password) async {
    return await _handler.post(ApiUrl.loginUrl, {
      'LoginEmail': LoginEmail,
      'password': password
    }, "");
  }

  static Future otpVerificationUser(String otp) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(StringValue.sessionTokenStr).toString();
    return await _handler.post(ApiUrl.otpVerificationUrl, {
      'otp': otp
    }, token);
  }

  static Future resetPassword(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(StringValue.sessionTokenStr).toString();
    return await _handler.post(ApiUrl.resetPasswordUrl, {
      'email': email
    }, token);
  }

  static Future otpRequestUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(StringValue.sessionTokenStr).toString();
    return await _handler.get(ApiUrl.otpRequestUrl, token);
  }

  static Future logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(StringValue.sessionTokenStr).toString();
    return await _handler.get(ApiUrl.logoutUrl, token);
  }

  static Future branch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(StringValue.sessionTokenStr).toString();
    return await _handler.get(ApiUrl.branchesUrl, token);
  }

  static Future productCategories() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(StringValue.sessionTokenStr).toString();
    return await _handler.get(ApiUrl.productCategoryUrl, token);
  }

  static Future productData(String idCategories) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(StringValue.sessionTokenStr).toString();
    return await _handler.get(ApiUrl.productUrl+idCategories, token);
  }

  static Future bannersData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(StringValue.sessionTokenStr).toString();
    return await _handler.get(ApiUrl.bannersUrl, token);
  }

  static Future servicesData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(StringValue.sessionTokenStr).toString();
    return await _handler.get(ApiUrl.servicesUrl, token);
  }

}
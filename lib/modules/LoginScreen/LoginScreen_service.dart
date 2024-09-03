import 'dart:convert';
import 'dart:io';

import 'package:http/io_client.dart';
import 'package:markaz_snappy/models/login_model.dart';
import '../../data/network/api.dart';
import '../../models/message_only_model.dart';

class LoginScreenService {

  Future<login_model?> loginUser(String email, String password, String firebaseToken) async {
    var res = await Api.loginUser(email, password, firebaseToken);
    try {
      login_model dataJson;
      dataJson = login_model.fromJson(res);

      return dataJson;
    } catch (e) {
      print("loginUser: "+e.toString());
      return null;
    }
  }

  Future<only_message_model?> loginUserByOtp(String loginPhone) async {
    var res = await Api.otpLoginRequestData(loginPhone);
    try {
      only_message_model dataJson;
      dataJson = only_message_model.fromJson(res);

      return dataJson;
    } catch (e) {
      print("loginUserOtp: "+e.toString());
      return null;
    }
  }

}
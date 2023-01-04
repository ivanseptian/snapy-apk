import 'dart:convert';

import 'package:markaz_snappy/models/no_data.dart';
import 'package:markaz_snappy/models/register_model.dart';
import 'package:markaz_snappy/models/test.dart';

import '../../data/network/api.dart';
import '../../utils/function.dart';

class RegisterScreenService {

  Future<register_model?> registerUser(String name, String email, String password, String phoneNumber) async {
    var res = await Api.registerUser(name, email, password, phoneNumber);
    try {
      register_model dataJson;
      dataJson = register_model.fromJson(res);

      return dataJson;
    } catch (e) {
      print("registerUser: "+e.toString());
      return null;
    }
  }

  Future<test?> tests() async {
    var res = await Api.test();
    try {
      test dataJson;
      dataJson = test.fromJson(res);

      return dataJson;
    } catch (e) {
      print("registerUser: "+e.toString());
      return null;
    }
  }


}
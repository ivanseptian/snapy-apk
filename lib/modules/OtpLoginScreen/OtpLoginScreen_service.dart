import 'package:markaz_snappy/models/login_model.dart';
import 'package:markaz_snappy/models/message_only_model.dart';

import '../../data/network/api.dart';

class OtpLoginScreenService {

  Future<only_message_model?> otpRequest(String loginPhone) async {
    var res = await Api.otpLoginRequestData(loginPhone);
    try {
      only_message_model dataJson;
      dataJson = only_message_model.fromJson(res);

      return dataJson;
    } catch (e) {
      print("otpRequest: "+e.toString());
      return null;
    }
  }

  Future<login_model?> otpVerification(String otp, String loginPhone, String firebaseToken) async {
    try {
      var res = await Api.otpLoginCheckData(loginPhone, otp, firebaseToken);
      login_model dataJson;
      dataJson = login_model.fromJson(res);
      return dataJson;
    } catch (e) {
      print("otpVerification: "+e.toString());
      return null;
    }
  }

}
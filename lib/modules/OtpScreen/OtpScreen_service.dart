import '../../data/network/api.dart';
import '../../models/no_data.dart';

class OtpScreenService {
  Future<NoData?> otpRequest() async {
    var res = await Api.otpRequestUser();
    try {
      NoData dataJson;
      dataJson = NoData.fromJson(res);

      return dataJson;
    } catch (e) {
      print("otpRequest: "+e.toString());
      return null;
    }
  }

  Future<NoData?> otpVerification(String otp) async {
    try {
      var res = await Api.otpVerificationUser(otp);
      NoData dataJson;
      dataJson = NoData.fromJson(res);
      return dataJson;
    } catch (e) {
      return null;
    }
  }

}
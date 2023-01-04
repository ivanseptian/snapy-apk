import '../../data/network/api.dart';
import '../../models/no_data.dart';

class ForgetPasswordService {
  Future<NoData?> sendForgetPasswordVerification(String email) async {
    try {
      var res = await Api.resetPassword(email);
      NoData dataJson;
      dataJson = NoData.fromJson(res);
      return dataJson;
    } catch (e) {
      return null;
    }
  }
}
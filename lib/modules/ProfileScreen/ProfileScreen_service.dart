import '../../data/network/api.dart';
import '../../models/login_model.dart';
import '../../models/no_data.dart';

class ProfileScreenService {

  Future<NoData?> logout() async {
    try {
      var res = await Api.logout();
      NoData dataJson;
      dataJson = NoData.fromJson(res);
      return dataJson;
    } catch (e) {
      return null;
    }
  }

  Future<NoData?> deleteAccount() async {
    try {
      var res = await Api.deleteAccount();
      NoData dataJson;
      dataJson = NoData.fromJson(res);
      return dataJson;
    } catch (e) {
      return null;
    }
  }

  Future<login_model?> profile() async {
    try {
      var res = await Api.profile();
      login_model dataJson;
      dataJson = login_model.fromJson(res);
      return dataJson;
    } catch (e) {
      return null;
    }
  }

}
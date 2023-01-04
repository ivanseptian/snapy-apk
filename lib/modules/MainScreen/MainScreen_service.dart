import '../../data/network/api.dart';
import '../../models/no_data.dart';

class MainScreenService {

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

}
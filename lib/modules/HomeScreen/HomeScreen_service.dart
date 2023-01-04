import 'package:markaz_snappy/models/banners_model.dart';

import '../../data/network/api.dart';

class HomeScreenService {

  Future<List<banners_model>?> banners() async {
    var res = await Api.bannersData();
    try {
      List<banners_model> dataJson;
      dataJson = List<banners_model>.from(res.map((model)=> banners_model.fromJson(model)));

      return dataJson;
    } catch (e) {
      print("banners: "+e.toString());
      return null;
    }
  }

}
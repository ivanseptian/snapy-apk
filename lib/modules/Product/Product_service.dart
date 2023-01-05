import 'package:markaz_snappy/models/product_model.dart';

import '../../data/network/api.dart';

class ProductService {

  Future<List<product_model>?> product(String idCategory) async {
    var res = await Api.productData(idCategory);
    try {
      List<product_model> dataJson;
      dataJson = List<product_model>.from(res.map((model)=> product_model.fromJson(model)));

      return dataJson;
    } catch (e) {
      print("product: "+e.toString());
      return null;
    }
  }

}
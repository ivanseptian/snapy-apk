import 'package:markaz_snappy/models/category_product_model.dart';

import '../../data/network/api.dart';

class ProductCategoryService {

  Future<List<category_product_model>?> productCategory() async {
    var res = await Api.productCategories();
    try {
      List<category_product_model> dataJson;
      dataJson = List<category_product_model>.from(res.map((model)=> category_product_model.fromJson(model)));

      return dataJson;
    } catch (e) {
      print("productCategory: "+e.toString());
      return null;
    }
  }

}
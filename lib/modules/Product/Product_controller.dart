import 'package:get/get.dart';
import 'package:markaz_snappy/models/product_model.dart';

import 'package:markaz_snappy/modules/Product/Product.dart';

import '../../utils/function.dart';

class ProductController extends GetxController {

  final ProductService _service;

  ProductController(this._service);

  var listProduct = <product_model>[].obs;

  @override
  void onInit() {
    loadProduct();
    super.onInit();

  }

  Future<void> loadProduct() async {
    try {
      // CoolAlert.show(
      //     context: Get.context!,
      //     type: CoolAlertType.loading,
      //     text: StringValue.loading
      // );

      List<product_model>? category = await _service.product(Get.arguments[0]);
      // Get.back();
      if(category!=null) {
        listProduct.value = category;
      } else {
        Functions.checkErrorPopup("");
      }
    } catch (e) {
      // Get.back();
      Functions.checkErrorPopup(e);
    }
  }

}
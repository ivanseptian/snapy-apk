import 'package:cool_alert/cool_alert.dart';
import 'package:get/get.dart';
import 'package:markaz_snappy/models/category_product_model.dart';

import 'package:markaz_snappy/modules/ProductCategory/ProductCategory.dart';

import '../../config/strings.dart';
import '../../utils/function.dart';

class ProductCategoryController extends GetxController {

  final ProductCategoryService _service;

  ProductCategoryController(this._service);

  var listCategory = <category_product_model>[].obs;

  @override
  void onInit() {
    loadCategory();
    super.onInit();

  }

  Future<void> loadCategory() async {
    try {
      // CoolAlert.show(
      //     context: Get.context!,
      //     type: CoolAlertType.loading,
      //     text: StringValue.loading
      // );

      List<category_product_model>? category = await _service.productCategory();
      // Get.back();
      if(category!=null) {
        listCategory.value = category;
      } else {
        Functions.checkErrorPopup("");
      }
    } catch (e) {
      // Get.back();
      Functions.checkErrorPopup(e);
    }
  }

}
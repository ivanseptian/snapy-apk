import 'package:get/get.dart';

import 'package:markaz_snappy/modules/ProductCategory/ProductCategory.dart';

class ProductCategoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductCategoryController(ProductCategoryService()));
  }
}
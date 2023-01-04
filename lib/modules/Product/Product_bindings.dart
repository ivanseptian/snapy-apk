import 'package:get/get.dart';

import 'package:markaz_snappy/modules/Product/Product.dart';

class ProductBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductController(ProductService()));
  }
}
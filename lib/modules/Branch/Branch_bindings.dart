import 'package:get/get.dart';

import 'package:markaz_snappy/modules/Branch/Branch.dart';

class BranchBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BranchController(BranchService()));
  }
}
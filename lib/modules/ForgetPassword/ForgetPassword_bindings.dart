import 'package:get/get.dart';

import 'package:markaz_snappy/modules/ForgetPassword/ForgetPassword.dart';

class ForgetPasswordBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgetPasswordController(ForgetPasswordService()));
  }
}
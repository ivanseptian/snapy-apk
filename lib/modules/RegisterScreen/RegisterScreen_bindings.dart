import 'package:get/get.dart';

import 'package:markaz_snappy/modules/RegisterScreen/RegisterScreen.dart';

class RegisterScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterScreenController(RegisterScreenService()));
  }
}
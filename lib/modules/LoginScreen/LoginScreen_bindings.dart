import 'package:get/get.dart';

import 'package:markaz_snappy/modules/LoginScreen/LoginScreen.dart';

class LoginScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginScreenController(LoginScreenService()));
  }
}
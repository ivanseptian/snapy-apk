import 'package:get/get.dart';

import 'OtpLoginScreen_controller.dart';
import 'OtpLoginScreen_service.dart';

class OtpLoginScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OtpLoginScreenController(OtpLoginScreenService()));
  }
}
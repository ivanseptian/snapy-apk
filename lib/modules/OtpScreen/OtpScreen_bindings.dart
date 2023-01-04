import 'package:get/get.dart';

import 'package:markaz_snappy/modules/OtpScreen/OtpScreen.dart';

class OtpScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OtpScreenController(OtpScreenService()));
  }
}
import 'package:get/get.dart';

import 'package:markaz_snappy/modules/HelpScreen/HelpScreen.dart';

class HelpScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HelpScreenController(HelpScreenService()));
  }
}
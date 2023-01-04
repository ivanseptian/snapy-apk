import 'package:get/get.dart';

import 'package:markaz_snappy/modules/MainScreen/MainScreen.dart';

class MainScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainScreenController(MainScreenService()));
  }
}
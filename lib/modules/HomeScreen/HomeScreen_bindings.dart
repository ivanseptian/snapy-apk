import 'package:get/get.dart';

import 'package:markaz_snappy/modules/HomeScreen/HomeScreen.dart';

class HomeScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeScreenController(HomeScreenService()));
  }
}
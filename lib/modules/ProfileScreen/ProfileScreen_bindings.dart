import 'package:get/get.dart';

import 'package:markaz_snappy/modules/ProfileScreen/ProfileScreen.dart';

class ProfileScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileScreenController(ProfileScreenService()));
  }
}
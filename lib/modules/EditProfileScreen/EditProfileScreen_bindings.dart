import 'package:get/get.dart';

import 'package:markaz_snappy/modules/EditProfileScreen/EditProfileScreen.dart';

class EditProfileScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditProfileScreenController(EditProfileScreenService()));
  }
}
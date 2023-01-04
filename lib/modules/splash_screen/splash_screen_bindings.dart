import 'package:get/get.dart';
import 'package:markaz_snappy/modules/splash_screen/splash_screen_controller.dart';
import 'package:markaz_snappy/modules/splash_screen/splash_screen_service.dart';

class Splash_screenBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Splash_screenController(Splash_screenService()));
  }
}
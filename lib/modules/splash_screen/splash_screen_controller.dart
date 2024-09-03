import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:markaz_snappy/modules/splash_screen/splash_screen_service.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../config/strings.dart';
import '../../routes/routes.dart';
import '../../utils/function.dart';
import '../../utils/prefs.dart';

class Splash_screenController extends GetxController {

  final Splash_screenService _service;

  Splash_screenController(this._service);

  @override
  Future<void> onInit() async {
    if (Platform.isAndroid) {
      final deviceInfo = await DeviceInfoPlugin().androidInfo;
      if ((deviceInfo.version.sdkInt??0) > 32) {
        await Functions.checkAndRequestPermission(
            Permission.notification, "Notification");
      }
    }
    await Future.delayed(const Duration(seconds: 2));
    checkSession();
    super.onInit();
  }

  void checkSession() async {
    // String? token = await Prefs.getString(StringValue.sessionTokenStr);
    // if(token == null) {
    //   Get.offAllNamed(Routes.loginScreen);
    // } else {
    //   Get.offAllNamed(Routes.mainScreen);
    // }
    Get.offAllNamed(Routes.mainScreen);
  }

}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../config/assets.dart';
import '../config/colors.dart';
import '../modules/splash_screen/splash_screen_controller.dart';

class Splash extends StatelessWidget {
  final Splash_screenController splash_screen;

  const Splash(this.splash_screen, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        body: Container(
          height: Get.height,
          width: Get.width,
          child: Center(
            child: Image.asset(
              AssetsValue.logo,
              height: 130.h,
              width: 130.w,
            ),
          ),
        )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markaz_snappy/config/config.dart';

import 'package:markaz_snappy/modules/HelpScreen/HelpScreen.dart';

import '../config/assets.dart';
import '../config/colors.dart';

class HelpScreen extends StatelessWidget {
  final HelpScreenController helpScreen;

  const HelpScreen(this.helpScreen, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            shrinkWrap: true,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    AssetsValue.logo,
                    height: 25.h,
                    width: 25.w,
                  )
                ],
              ),
              Gap(20.h),
              Text(
                StringValue.helpString,
                style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w300,
                    color: Colors.white),
              ),
            ],
          ),
        )
    ));
  }
}
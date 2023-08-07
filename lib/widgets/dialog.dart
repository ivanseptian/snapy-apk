import 'dart:io';

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/strings.dart';
import '../routes/routes.dart';
import '../utils/prefs.dart';
import 'custom_alert.dart';

class Dialogs {
  showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => CustomAlert(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 15.0.h),
              Text(
                StringValue.appName,
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0.sp,
                ),
              ),
              SizedBox(height: 25.0.h),
              Text(
                'Apakah anda yakin untuk keluar?',
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0.sp,
                ),
              ),
              SizedBox(height: 40.0.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    height: 40.0.h,
                    width: 130.0.h,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          side: BorderSide(color: Theme.of(context).colorScheme.secondary),
                        ),
                        backgroundColor: Colors.white
                      ),
                      child: Text(
                        'Tidak',
                        style: GoogleFonts.roboto(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  SizedBox(
                    height: 40.0.h,
                    width: 130.0.w,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        onPrimary: Colors.black87,
                        primary: Theme.of(context).colorScheme.secondary,
                      ),
                      child: Text(
                        'Ya',
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        Prefs.clear();
                        Get.offAllNamed(Routes.mainScreen);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0.h),
            ],
          ),
        ),
      ),
    );
  }

  showLogoutDialog1(BuildContext context) {
    CoolAlert.show(
        context: context,
        type: CoolAlertType.confirm,
        text: "",
        title: "Apakah Anda yakin ingin keluar akun?",
        onCancelBtnTap: () => Get.back(),
        onConfirmBtnTap: () {
          Prefs.clear();
          Get.offAllNamed(Routes.mainScreen);
        }
    );
  }

  showExitDialog1(BuildContext context) {
    CoolAlert.show(
        context: context,
        type: CoolAlertType.confirm,
        text: "",
        title: "Apakah Anda yakin ingin keluar aplikasi?",
        onCancelBtnTap: () => Get.back(),
        onConfirmBtnTap: () {
          if (Platform.isAndroid) {
            SystemNavigator.pop();
          } else if (Platform.isIOS) {
            exit(0);
          }
        }
    );
  }


}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:markaz_snappy/modules/OtpScreen/OtpScreen.dart';

import '../config/assets.dart';
import '../config/colors.dart';
import '../config/strings.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

import '../widgets/button.dart';

class OtpScreen extends StatelessWidget {
  final OtpScreenController otpScreen;

  const OtpScreen(this.otpScreen, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 9.w),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                StringValue.otpMasukanOtp,
                style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ),
            Gap(15.h),
            PinCodeTextField(
              key: otpScreen.inputTxtOTPKey,
              controller: otpScreen.inputTxtOTP.value,
              autofocus: true,
              hideCharacter: true,
              pinBoxBorderWidth: 0,
              hasTextBorderColor: ColorsValue.backgroundColor,
              pinBoxRadius: 5,
              maxLength: 6,
              hasError: false,
              onTextChanged: (text) {},
              onDone: (text) {
                otpScreen.verficationOTP();
                print("DONE $text");
                print("DONE CONTROLLER");
              },
              pinBoxWidth: 50,
              pinBoxHeight: 55,
              hasUnderline: true,
              wrapAlignment: WrapAlignment.spaceAround,
              pinBoxDecoration:
                  ProvidedPinBoxDecoration.defaultPinBoxDecoration,
              pinTextStyle: const TextStyle(fontSize: 20.0),
              pinTextAnimatedSwitcherTransition:
                  ProvidedPinBoxTextAnimation.scalingTransition,
//                    pinBoxColor: Colors.green[100],
              pinTextAnimatedSwitcherDuration:
                  const Duration(milliseconds: 300),
//                    highlightAnimation: true,
              highlightAnimationBeginColor: Colors.black,
              highlightAnimationEndColor: Colors.white12,
              keyboardType: TextInputType.number,
            ),
            Gap(19.h),
            // Button(
            //   text: StringValue.otpLanjut,
            //   color: ColorsValue.backgroundColor,
            //   onPress: () {},
            //   height: 50,
            //   radius: 5,
            //   textSize: 16,
            //   textColor: Colors.white,
            //   fontWeight: FontWeight.w500,
            //   borderColor: ColorsValue.backgroundColor,
            // ),
            // Gap(19.h),
            GestureDetector(
              child: Text(
                StringValue.otpKirimUlang,
                style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              onTap: () => {
                otpScreen.requestOTP()
              },
            )
            // Obx(
            //         () => otp_screen.countDownOTP.value > 0 ? Text(
            //       "00:${otp_screen.countDownOTP}",
            //       style: GoogleFonts.poppins(
            //           fontSize: 14.sp,
            //           fontWeight: FontWeight.w400,
            //           color: ColorsValue.otpTextColorFF
            //       ),
            //     ) : Container()
            // ),
            // Gap(3.h),
            // Obx(
            //         () => Visibility(
            //       child: GestureDetector(
            //         child: Text(
            //           StringValue.otpKirimUlang,
            //           style: GoogleFonts.poppins(
            //               fontSize: 16.sp,
            //               fontWeight: FontWeight.w400,
            //               color: ColorsValue.otpTextColorFF
            //           ),
            //         ),
            //         onTap: () => otp_screen.otpSend(),
            //       ),
            //       visible: otp_screen.visibilityKirimUlang.value,
            //     )
            // ),
          ],
        ),
      ),
    );
  }
}

import 'package:colour/colour.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:markaz_snappy/modules/LoginScreen/LoginScreen.dart';

import '../config/assets.dart';
import '../config/colors.dart';
import '../config/strings.dart';
import '../routes/routes.dart';
import '../widgets/button.dart';
import '../widgets/inputFieldPrefix.dart';

class LoginScreen extends StatelessWidget {
  final LoginScreenController loginScreen;

  const LoginScreen(this.loginScreen, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: new Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
            top: -99.95,
            left: -160,
            child: SvgPicture.asset(
              AssetsValue.ellipse_22,
              width: 674.w,
              height: 262.h,
              color: ColorsValue.backgroundColor,
            ),
          ),
          Positioned(
            top: -66.91,
            left: -71.71,
            child: SvgPicture.asset(
              AssetsValue.ellipse_21,
              width: 622.55.w,
              height: 405.13.h,
              color: ColorsValue.secondaryColor,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: ListView(
                shrinkWrap: true,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(64.h),
                      Padding(
                        padding: EdgeInsets.only(left: 7.w),
                        child: GestureDetector(
                          onTap: () {
                            Get.offNamed(Routes.mainScreen);
                          },
                          child: SvgPicture.asset(
                            AssetsValue.left_arrow,
                            height: 30.h,
                            width: 30.w,
                            color: ColorsValue.backgroundColor,
                          ),
                        ),
                      ),
                      Gap(72.h),
                      Padding(
                        padding: EdgeInsets.only(left: 34.w),
                        child: Text(
                          StringValue.lcLoginTxt,
                          style: GoogleFonts.poppins(
                              fontSize: 22.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Gap(28.h),
                      Padding(
                        padding: EdgeInsets.only(left: 34.w),
                        child: Text(
                          StringValue.lcSelamatDatangTxt,
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Gap(46.h),
                      Obx(() => Form(
                            key: loginScreen.formKey,
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 41.w),
                                  child: InputFieldPrefix(
                                    labelText: StringValue.emailTxt,
                                    key: loginScreen.inputTxtEmailKey,
                                    editingController:
                                        loginScreen.inputTxtEmail.value,
                                    isRequired: true,
                                    validate: (text) {
                                      if (text == null || text.isEmpty) {
                                        return StringValue.fieldRequired;
                                      }
                                      return null;
                                    },
                                    inputAction: TextInputAction.next,
                                    inputType: TextInputType.emailAddress,
                                    prefixIcon: _prefixEmail(),
                                    textSize: 12,
                                    textColor: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    hintColor: ColorsValue.textColorD0,
                                  ),
                                ),
                                Gap(35.2.h),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 41.w),
                                  child: InputFieldPrefix(
                                    labelText: StringValue.passwordTxt,
                                    key: loginScreen.inputTxtPasswordKey,
                                    editingController:
                                        loginScreen.inputTxtPassword.value,
                                    isRequired: true,
                                    validate: (text) {
                                      if (text == null || text.isEmpty) {
                                        return StringValue.fieldRequired;
                                      } else if (text.length < 8) {
                                        return StringValue
                                            .fieldSandiMinimal8Char;
                                      }
                                      return null;
                                    },
                                    inputAction: TextInputAction.done,
                                    inputType: TextInputType.text,
                                    isObsecure:
                                        loginScreen.isObsecurePass.value,
                                    suffixIcon:
                                        loginScreen.isObsecurePass.value == true
                                            ? _suffixPassword(AssetsValue.show)
                                            : _suffixPassword(AssetsValue.hide),
                                    onSuffixIconClick: () {
                                      loginScreen.showHidePassword();
                                    },
                                    prefixIcon: _prefixPassword(),
                                    textSize: 12,
                                    textColor: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    hintColor: ColorsValue.textColorD0,
                                  ),
                                )
                              ],
                            ),
                          )),
                      Gap(22.52.h),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.forgetPasswordScreen);
                        },
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            StringValue.lupaPasswordTxt,
                            style: GoogleFonts.poppins(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      Gap(10.h),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.registerScreen);
                        },
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            StringValue.belumPunyaAccountTxt,
                            style: GoogleFonts.poppins(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      Gap(10.h),
                    ],
                  )
                ],
              )),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 9.w),
                  child: Button(
                      text: StringValue.masukTxt,
                      color: ColorsValue.backgroundColor,
                      onPress: () {
                        if(loginScreen.formKey.currentState!.validate()){
                          loginScreen.submitLogin();
                        }
                      },
                      height: 50,
                      radius: 5,
                      textSize: 16,
                      textColor: ColorsValue.textColorFF,
                      fontWeight: FontWeight.w500,
                      borderColor: ColorsValue.backgroundColor),
                ),
              ),
              Gap(22.h),
            ],
          )
        ],
      ),
    ),
      onWillPop: () async {
        Get.offNamed(Routes.mainScreen);
        return false;
      }
    );
  }

  Widget _suffixPassword(String assetValue) {
    return SvgPicture.asset(
      assetValue,
      height: 13.79.h,
      width: 17.13.w,
      color: Colors.white,
    );
  }

  Widget _prefixPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Gap(5.w),
        SvgPicture.asset(
          AssetsValue.lock,
          height: 18.h,
          width: 12.6.w,
          color: Colors.white,
        ),
        Gap(12.w),
        Container(
          color: ColorsValue.borderSideInputText1Color,
          height: 24.26.h,
          width: 1.w,
        ),
        Gap(18.35.w)
      ],
    );
  }

  Widget _prefixEmail() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          AssetsValue.mail,
          height: 18.h,
          width: 12.6.w,
          color: Colors.white,
        ),
        Gap(10.5.w),
        Container(
          color: ColorsValue.borderSideInputText1Color,
          height: 24.26.h,
          width: 1.w,
        ),
        Gap(18.35.w)
      ],
    );
  }
}

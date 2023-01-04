import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:markaz_snappy/modules/ForgetPassword/ForgetPassword.dart';

import '../config/assets.dart';
import '../config/colors.dart';
import '../config/strings.dart';
import '../widgets/button.dart';
import '../widgets/inputFieldPrefix.dart';

class ForgetPassword extends StatelessWidget {
  final ForgetPasswordController forgetPassword;

  const ForgetPassword(this.forgetPassword, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsValue.backgroundWhite,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: ListView(
            shrinkWrap: true,
            children: [
              Gap(41.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 9.w),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: SvgPicture.asset(
                        AssetsValue.x,
                        height: 16.h,
                        width: 16.w,
                        color: ColorsValue.textColor00,
                      ),
                      onTap: (){
                        Get.back();
                      },
                    ),
                    Text(
                      StringValue.resetPasswordTxt,
                      style: GoogleFonts.poppins(
                          fontSize: 25.sp,
                          color: ColorsValue.textColor00,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    GestureDetector(
                      child: Text(
                        StringValue.rsMasukTxt,
                        style: GoogleFonts.poppins(
                            fontSize: 14.sp,
                            color: ColorsValue.textColor00,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      onTap: (){
                        Get.back();
                      },
                    ),
                  ],
                ),
              ),
              Gap(58.h),
              Obx(
                      () => Form(
                      key: forgetPassword.formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 41.w),
                            child: InputFieldPrefix(labelText: StringValue.emailTxt,
                              key: forgetPassword.inputTxtEmailKey,
                              editingController: forgetPassword.inputTxtEmail.value,
                              isRequired: true, validate: (text) {
                                if (text == null || text.isEmpty) {
                                  return StringValue.fieldRequired;
                                }
                                return null;
                              },
                              inputAction: TextInputAction.next, inputType: TextInputType.emailAddress,
                              prefixIcon: _prefixEmail(), textSize: 12, textColor: ColorsValue.textColor00,
                              fontWeight: FontWeight.w500, hintColor: ColorsValue.textColorD0,),
                          ),
                          Gap(26.h),
                        ],
                      )
                  )
              ),
              Gap(
                  10.h
              ),
            ],
          )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 9.w),
              child: Button(text: StringValue.resetPasswordTxt, color: ColorsValue.backgroundColor,
                  onPress: (){
                    if(forgetPassword.formKey.currentState!.validate()){
                      forgetPassword.sendLupaPassword();
                    }
                  }, height: 50, radius: 5, textSize: 16, textColor: ColorsValue.textColorFF,
                  fontWeight: FontWeight.w500, borderColor: ColorsValue.backgroundColor),
            ),
          ),
          Gap(
              10.h
          ),
        ],
      ),
    );
  }

  Widget _prefixEmail(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          AssetsValue.mail,
          height: 18.h,
          width: 12.6.w,
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
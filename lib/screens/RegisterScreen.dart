import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:markaz_snappy/modules/RegisterScreen/RegisterScreen.dart';

import '../config/assets.dart';
import '../config/colors.dart';
import '../config/strings.dart';
import '../widgets/button.dart';
import '../widgets/inputFieldPrefix.dart';

class RegisterScreen extends StatelessWidget {
  final RegisterScreenController registerScreen;

  const RegisterScreen(this.registerScreen, {Key? key}) : super(key: key);

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
                      StringValue.rsDaftarTxt,
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
                      key: registerScreen.formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 40.w, right: 29.w),
                            child: InputFieldPrefix(labelText: StringValue.rsNamaLengkap,
                              key: registerScreen.inputTxtNamaLengkapKey,
                              editingController: registerScreen.inputTxtNamaLengkap.value,
                              isRequired: true, validate: (text) {
                                if (text == null || text.isEmpty) {
                                  return StringValue.fieldRequired;
                                }
                                return null;
                              },
                              inputAction: TextInputAction.next, inputType: TextInputType.text,
                              prefixIcon: _prefixNamaLengkap(), textSize: 12, textColor: ColorsValue.textColor00,
                              fontWeight: FontWeight.w500, hintColor: ColorsValue.textColorAA,),
                          ),
                          Gap(26.h),
                          Padding(
                            padding: EdgeInsets.only(left: 40.w, right: 29.w),
                            child: InputFieldPrefix(labelText: StringValue.rsNoHandphoneTxt,
                              key: registerScreen.inputTxtPhoneNumberKey,
                              editingController: registerScreen.inputTxtPhoneNumber.value,
                              isRequired: true, validate: (text) {
                                if (text == null || text.isEmpty) {
                                  return StringValue.fieldRequired;
                                }
                                return null;
                              },
                              textInputFormatter: [
                                FilteringTextInputFormatter.allow(RegExp("[0-9\u0660-\u0669]")),
                                FilteringTextInputFormatter.deny(RegExp(r'^6+')),
                                FilteringTextInputFormatter.deny(RegExp(r'^2+')),
                                FilteringTextInputFormatter.deny(RegExp(r'^0+'))
                              ],
                              inputAction: TextInputAction.next, inputType: TextInputType.phone,
                              prefixIcon: _prefixNoHp(), textSize: 12, textColor: ColorsValue.textColor00,
                              fontWeight: FontWeight.w500, hintColor: ColorsValue.textColorAA,),
                          ),
                          Gap(26.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 41.w),
                            child: InputFieldPrefix(labelText: StringValue.emailTxt,
                              key: registerScreen.inputTxtEmailKey,
                              editingController: registerScreen.inputTxtEmail.value,
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
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 41.w),
                            child: InputFieldPrefix(labelText: StringValue.passwordTxt,
                              key: registerScreen.inputTxtPasswordKey,
                              editingController: registerScreen.inputTxtPassword.value,
                              isRequired: true, validate: (text) {
                                if (text == null || text.isEmpty) {
                                  return StringValue.fieldRequired;
                                } else if(text.length < 8) {
                                  return StringValue.fieldSandiMinimal8Char;
                                }
                                return null;
                              },
                              inputAction: TextInputAction.next, inputType: TextInputType.text,
                              isObsecure: registerScreen.isObsecurePass.value,
                              suffixIcon: registerScreen.isObsecurePass.value == true ?
                              _suffixPassword(AssetsValue.show) : _suffixPassword(AssetsValue.hide),
                              onSuffixIconClick: (){
                                registerScreen.showHidePassword();
                              },
                              prefixIcon: _prefixPassword(), textSize: 12, textColor: ColorsValue.textColor00,
                              fontWeight: FontWeight.w500, hintColor: ColorsValue.textColorD0,),
                          ),
                          Gap(26.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 41.w),
                            child: InputFieldPrefix(labelText: StringValue.confirmPasswordTxt,
                              key: registerScreen.inputTxtConfirmPasswordKey,
                              editingController: registerScreen.inputTxtConfirmPassword.value,
                              isRequired: true, validate: (text) {
                                if (text == null || text.isEmpty) {
                                  return StringValue.fieldRequired;
                                } else if(text.length < 8) {
                                  return StringValue.fieldSandiMinimal8Char;
                                } else if(text != registerScreen.inputTxtPassword.value.text){
                                  return StringValue.passwordTidakSama;
                                }
                                return null;
                              },
                              inputAction: TextInputAction.done, inputType: TextInputType.text,
                              isObsecure: registerScreen.isObsecureConfirmPass.value,
                              suffixIcon: registerScreen.isObsecureConfirmPass.value == true ?
                              _suffixPassword(AssetsValue.show) : _suffixPassword(AssetsValue.hide),
                              onSuffixIconClick: (){
                                registerScreen.showHideConfirmPassword();
                              },
                              prefixIcon: _prefixPassword(), textSize: 12, textColor: ColorsValue.textColor00,
                              fontWeight: FontWeight.w500, hintColor: ColorsValue.textColorD0,),
                          )
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
              child: Button(text: StringValue.rsDaftarTxt, color: ColorsValue.backgroundColor,
                  onPress: (){
                    if(registerScreen.formKey.currentState!.validate()){
                      registerScreen.submitRegister();
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

  Widget _prefixNoHp(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // SvgPicture.asset(
        //   AssetsValue.smartphone,
        //   height: 18.h,
        //   width: 12.6.w,
        // ),
        Text(
          "+62",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 10.sp,
            fontWeight: FontWeight.w500
          ),
        ),
        Gap(10.w),
        Container(
          color: ColorsValue.borderSideInputText1Color,
          height: 24.26.h,
          width: 1.w,
        ),
        Gap(18.35.w)
      ],
    );
  }

  Widget _prefixNamaLengkap(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          AssetsValue.profile,
          height: 18.h,
          width: 18.w,
        ),
        Gap(10.w),
        Container(
          color: ColorsValue.borderSideInputText1Color,
          height: 25.5.h,
          width: 1.w,
        ),
        Gap(19.w)
      ],
    );
  }

  Widget _prefixPassword(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Gap(5.w),
        SvgPicture.asset(
          AssetsValue.lock,
          height: 18.h,
          width: 12.6.w,
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

  Widget _suffixPassword(String assetValue){
    return SvgPicture.asset(
      assetValue,
      height: 13.79.h,
      width: 17.13.w,
    );
  }

}
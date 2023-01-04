import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:markaz_snappy/modules/EditProfileScreen/EditProfileScreen.dart';

import '../config/assets.dart';
import '../config/colors.dart';
import '../config/strings.dart';
import '../widgets/button.dart';
import '../widgets/inputFieldPrefix.dart';

class EditProfileScreen extends StatelessWidget {
  final EditProfileScreenController editProfileScreen;

  const EditProfileScreen(this.editProfileScreen, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsValue.backgroundWhite,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: ListView(
              shrinkWrap: true,
              children: [
                Gap(10.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 9.w),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        child: SvgPicture.asset(
                          AssetsValue.left_arrow,
                          height: 25.h,
                          width: 25.w,
                          color: ColorsValue.textColor00,
                        ),

                        onTap: (){
                          Get.back();
                        },
                      ),
                      Text(
                        "Edit Profile",
                        style: GoogleFonts.poppins(
                            fontSize: 20.sp,
                            color: ColorsValue.textColor00,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      Container()
                    ],
                  ),
                ),
                Gap(58.h),
                Obx(
                        () => Form(
                        key: editProfileScreen.formKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 40.w, right: 29.w),
                              child: InputFieldPrefix(labelText: StringValue.rsNamaLengkap,
                                key: editProfileScreen.inputTxtNamaLengkapKey,
                                editingController: editProfileScreen.inputTxtNamaLengkap.value,
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
                                key: editProfileScreen.inputTxtPhoneNumberKey,
                                editingController: editProfileScreen.inputTxtPhoneNumber.value,
                                isRequired: true, validate: (text) {
                                  if (text == null || text.isEmpty) {
                                    return StringValue.fieldRequired;
                                  }
                                  return null;
                                },
                                inputAction: TextInputAction.next, inputType: TextInputType.phone,
                                prefixIcon: _prefixNoHp(), textSize: 12, textColor: ColorsValue.textColor00,
                                fontWeight: FontWeight.w500, hintColor: ColorsValue.textColorAA,),
                            ),
                            Gap(26.h),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 41.w),
                              child: InputFieldPrefix(labelText: StringValue.emailTxt,
                                key: editProfileScreen.inputTxtEmailKey,
                                editingController: editProfileScreen.inputTxtEmail.value,
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
                              child: InputFieldPrefix(labelText: StringValue.alamatTxt,
                                key: editProfileScreen.inputTxtAlamatKey,
                                editingController: editProfileScreen.inputTxtAlamat.value,
                                isRequired: true, validate: (text) {
                                  return null;
                                },
                                inputAction: TextInputAction.done, inputType: TextInputType.text,
                                prefixIcon: _prefixAddress(), textSize: 12, textColor: ColorsValue.textColor00,
                                fontWeight: FontWeight.w500, hintColor: ColorsValue.textColorD0,),
                            ),
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
                child: Column(
                  children: [
                    Button(text: "Kirim Atur Ulang Sandi", color: ColorsValue.backgroundWhite,
                        onPress: (){
                          // registerScreen.submit();
                        }, height: 50, radius: 5, textSize: 16, textColor: ColorsValue.backgroundColor,
                        fontWeight: FontWeight.w500, borderColor: ColorsValue.backgroundColor),
                    Gap(5.h),
                    Button(text: "Save Edit", color: ColorsValue.backgroundColor,
                        onPress: (){
                          // registerScreen.submit();
                        }, height: 50, radius: 5, textSize: 16, textColor: ColorsValue.textColorFF,
                        fontWeight: FontWeight.w500, borderColor: ColorsValue.backgroundColor)
                  ],
                ),
              ),
            ),
            Gap(
                10.h
            ),
          ],
        ),
      ),
    );
  }

  Widget _prefixNoHp(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          AssetsValue.smartphone,
          height: 18.h,
          width: 12.6.w,
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

  Widget _prefixAddress(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          AssetsValue.homeLocationImage,
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
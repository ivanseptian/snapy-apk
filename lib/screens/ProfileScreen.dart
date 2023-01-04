import 'package:colour/colour.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:markaz_snappy/modules/ProfileScreen/ProfileScreen.dart';
import 'package:markaz_snappy/routes/routes.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../config/assets.dart';
import '../config/colors.dart';
import '../config/strings.dart';
import '../utils/prefs.dart';
import '../widgets/dialog.dart';

class ProfileScreen extends StatelessWidget {
  final ProfileScreenController profileScreen;

  const ProfileScreen(this.profileScreen, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsValue.backgroundWhite,
        body: Stack(
          children: [
            Container(
              width: Get.width,
              height: 165.h,
              color: ColorsValue.backgroundColor,
            ),
            Obx(() => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(50.h),
                Padding(
                  padding: EdgeInsets.only(left: 8.w, right: 8.w),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(),
                      // GestureDetector(
                      //   onTap: () {
                      //     Get.toNamed(Routes.editProfileScreen);
                      //   },
                      //   child: Text(
                      //     "Edit Profile",
                      //     style: GoogleFonts.poppins(
                      //         fontSize: 16.sp,
                      //         color: Colors.white,
                      //         fontWeight: FontWeight.w500
                      //     ),
                      //   ),
                      // ),
                      GestureDetector(
                        onTap: () {
                          CoolAlert.show(
                              context: context,
                              type: CoolAlertType.confirm,
                              text: "",
                              title: "Apakah Anda yakin ingin keluar akun?",
                              onCancelBtnTap: () => Get.back(),
                              onConfirmBtnTap: () {
                                profileScreen.logout();
                              }
                          );
                          // Prefs.clear();
                          // Get.offAllNamed(Routes.loginScreen);
                        },
                        child: Text(
                          "Keluar",
                          style: GoogleFonts.poppins(
                              fontSize: 16.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Gap(35.h),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: Container(
                        padding: EdgeInsets.all(1),
                        color: Colors.white,
                        child: SvgPicture.asset(
                            AssetsValue.userIcon,
                            height: 100.h,
                            width: 100.w,
                            fit: BoxFit.fill,
                          color: ColorsValue.backgroundColor,
                        )
                    ),
                  ),
                ),
                Gap(16.h),
                Center(
                  child: Text(
                    "${profileScreen.name} (${profileScreen.id})",
                    style: GoogleFonts.poppins(
                        fontSize: 20.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Center(
                  child: Text(
                    "${profileScreen.email}",
                    style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        color: ColorsValue.textColor00,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                ),
                Gap(19.h),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorsValue.backgroundColor),
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                    color: ColorsValue.backgroundColor,
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  child: TabBar(
                    controller: profileScreen.tabController,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        100,
                      ),
                      color: Colors.white,
                    ),
                    labelStyle: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp),
                    unselectedLabelStyle: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp),
                    onTap: (value) {
                      profileScreen.indexTab.value = value;
                      profileScreen.tabController.animateTo(value);
                    },
                    labelColor: ColorsValue.backgroundColor,
                    unselectedLabelColor: ColorsValue.backgroundWhite,
                    tabs: [
                      Tab(
                        child: Text(
                          "Profile",
                        ),
                      ),

                      Tab(
                        child: Text(
                          "Membership",
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(5.h),
                Expanded(child: IndexedStack(
                  index: profileScreen.indexTab.value,
                  children: [infoTab(), membershipTab()],
                ))
              ],
            ))
          ],
        )
    );
  }

  Widget infoTab(){
    return ListView(
      shrinkWrap: true,
      children: [
        Center(
          child: Padding(padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: QrImage(
              data: profileScreen.qrData.value,
              version: QrVersions.auto,
              size: 250,
            ),
          ),
        ),
        Padding(padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "No HP",
                style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black
                ),
              ),
              Gap(3.h),
              Text(
                "${profileScreen.phone}",
                style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black
                ),
              ),
              Gap(5.h),
              Divider(
                  color: ColorsValue.psColorE8
              )
            ],
          ),),
        Gap(15.h),
        Padding(padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Alamat",
                style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black
                ),
              ),
              Gap(3.h),
              Text(
                "${profileScreen.address}",
                style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black
                ),
              ),
              Gap(5.h),
              Divider(
                  color: ColorsValue.psColorE8
              )
            ],
          ),),
        Gap(15.h),
        Padding(padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            "Legal Information",
            style: GoogleFonts.poppins(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black
            ),
          ),),
        Gap(10.h),
        Padding(padding: EdgeInsets.only(right: 16.w, left: 25.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Term and Conditions",
                style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black
                ),
              ),
              Gap(10.h),
              Text(
                "Privacy Policy",
                style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black
                ),
              ),
              Gap(5.h),
            ],
          ),),
      ],
    );
  }

  Widget membershipTab(){
    return Padding(padding: EdgeInsets.symmetric(horizontal: 16.w),
    child: ListView(
      shrinkWrap: true,
      children: [
        Card(
          color: ColorsValue.textColorD0,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${profileScreen.name}",
                      style: GoogleFonts.poppins(
                          fontSize: 16.sp,
                          color: ColorsValue.backgroundWhite,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    Text(
                      "${profileScreen.points} Points",
                      style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          color: Colour(Colors.white),
                          fontWeight: FontWeight.w400
                      ),
                    )
                  ],
                ),
                Gap(35.h),
                Image.asset(
                  AssetsValue.logo,
                  height: 30.h,
                  fit: BoxFit.fitWidth,
                ),
                Gap(35.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Exp: ${profileScreen.expired}",
                      style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          color: ColorsValue.backgroundWhite,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                    Text(
                      "No: ${profileScreen.id}",
                      style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          color: ColorsValue.backgroundWhite,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    ),);
  }

}
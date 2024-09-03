import 'package:cached_network_image/cached_network_image.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:markaz_snappy/modules/ProfileScreen/ProfileScreen.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

import '../config/assets.dart';
import '../config/colors.dart';
import '../utils/function.dart';

class ProfileScreen extends StatelessWidget {
  final ProfileScreenController profileScreen;

  const ProfileScreen(this.profileScreen, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
      children: [
        // Container(
        //   width: Get.width,
        //   height: 165.h,
        //   color: ColorsValue.backgroundColor,
        // ),
        Obx(() => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8.w, right: 8.w),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Container(),
                      GestureDetector(
                        onTap: () {
                          // Get.toNamed(Routes.editProfileScreen);
                          CoolAlert.show(
                              context: context,
                              type: CoolAlertType.confirm,
                              text: "",
                              title:
                                  "apakah Anda yakin untuk menghapus akun anda secara permanen?",
                              onCancelBtnTap: () => Get.back(),
                              onConfirmBtnTap: () {
                                profileScreen.deleteAccount();
                              });
                        },
                        child: Text(
                          "Hapus Akun",
                          style: GoogleFonts.poppins(
                              fontSize: 16.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
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
                              });
                          // Prefs.clear();
                          // Get.offAllNamed(Routes.loginScreen);
                        },
                        child: Text(
                          "Keluar",
                          style: GoogleFonts.poppins(
                              fontSize: 16.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                ),
                Gap(10.h),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: Container(
                        padding: const EdgeInsets.all(1),
                        color: Colors.white,
                        child: SvgPicture.asset(
                          AssetsValue.userIcon,
                          height: 100.h,
                          width: 100.w,
                          fit: BoxFit.fill,
                          // color: ColorsValue.backgroundColor,
                        )),
                  ),
                ),
                Gap(16.h),
                Center(
                  child: Text(
                    "${profileScreen.userProfileData.value.loginName}",
                    style: GoogleFonts.poppins(
                      fontSize: 20.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        profileScreen.profile();
                      },
                      child: SvgPicture.asset(
                        AssetsValue.refreshIcon,
                        height: 25.h,
                        width: 25.w,
                        color: Colors.white,
                      ),
                    ),
                    Gap(10.w),
                    Flexible(
                        child: Text(
                      "${profileScreen.id}",
                      style: GoogleFonts.poppins(
                        fontSize: 20.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    )),
                  ],
                ),
                Center(
                  child: Text(
                    "${profileScreen.userProfileData.value.loginEmail}",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Gap(19.h),
                profileScreen.tabController.length > 0 ?
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: ColorsValue.backgroundColor), // Fallback to Colors.black if null
                    borderRadius: BorderRadius.circular(100),
                    color: ColorsValue.backgroundColor ??
                        Colors.black, // Fallback to Colors.black if null
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  child: TabBar(
                          controller: profileScreen.tabController!,
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white,
                          ),
                          labelStyle: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                          ),
                          unselectedLabelStyle: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                          ),
                          onTap: (value) {
                            profileScreen.indexTab.value = value;
                            profileScreen.tabController!.animateTo(value);
                          },
                          labelColor: ColorsValue.backgroundColor ??
                              Colors.black, // Fallback to Colors.black if null
                          unselectedLabelColor: ColorsValue.backgroundWhite ??
                              Colors.white, // Fallback to Colors.white if null
                          tabs: const [
                            Tab(
                              child: Text("Profile"),
                            ),
                            Tab(
                              child: Text("Membership"),
                            ),
                          ],
                        )// Fallback widget if tabController is null
                ) : const SizedBox(),
                Gap(5.h),
                Expanded(
                    child: profileScreen.tabController.length > 0
                    ? IndexedStack(
                      index: profileScreen.indexTab.value,
                      children: [infoTab(), membershipTab()],
                    ) : const SizedBox()
                )
              ],
            ))
      ],
    ));
  }

  Widget infoTab() {
    return ListView(
      shrinkWrap: true,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Center(
            child: QrImage(
              data: profileScreen.qrData.value,
              version: QrVersions.auto,
              size: 250,
              backgroundColor: Colors.white,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "No HP",
                style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              Gap(3.h),
              Text(
                "${profileScreen.userProfileData.value.loginPhone}",
                style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              Gap(5.h),
              Divider(color: ColorsValue.psColorE8)
            ],
          ),
        ),
        Gap(15.h),

        // Padding(padding: EdgeInsets.symmetric(horizontal: 16.w),
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Text(
        //         "Alamat",
        //         style: GoogleFonts.poppins(
        //             fontSize: 16.sp,
        //             fontWeight: FontWeight.w500,
        //             color: Colors.white
        //         ),
        //       ),
        //       Gap(3.h),
        //       Text(
        //         "${profileScreen.address}",
        //         style: GoogleFonts.poppins(
        //             fontSize: 14.sp,
        //             fontWeight: FontWeight.w400,
        //             color: Colors.white
        //         ),
        //       ),
        //       Gap(5.h),
        //       Divider(
        //           color: ColorsValue.psColorE8
        //       )
        //     ],
        //   ),),
        // Gap(15.h),
        // Padding(padding: EdgeInsets.symmetric(horizontal: 16.w),
        //   child: Text(
        //     "Legal Information",
        //     style: GoogleFonts.poppins(
        //         fontSize: 16.sp,
        //         fontWeight: FontWeight.w500,
        //         color: Colors.white
        //     ),
        //   ),),
        // Gap(10.h),
        // Padding(padding: EdgeInsets.only(right: 16.w, left: 25.w),
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Text(
        //         "Term and Conditions",
        //         style: GoogleFonts.poppins(
        //             fontSize: 16.sp,
        //             fontWeight: FontWeight.w500,
        //             color: Colors.white
        //         ),
        //       ),
        //       Gap(10.h),
        //       Text(
        //         "Privacy Policy",
        //         style: GoogleFonts.poppins(
        //             fontSize: 16.sp,
        //             fontWeight: FontWeight.w500,
        //             color: Colors.white
        //         ),
        //       ),
        //       Gap(5.h),
        //     ],
        //   ),),
      ],
    );
  }

  Widget membershipTab() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: ListView(
        shrinkWrap: true,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: CachedNetworkImage(
                  imageUrl:
                      profileScreen.userProfileData.value.imageCardUrl ?? "",
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                left: 20.w,
                bottom: 20.h,
                child: Text(
                  "${profileScreen.userProfileData.value.loginName}",
                  style: GoogleFonts.roboto(
                      fontSize: 20.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w800),
                ),
              )
            ],
          ),
          // Card(
          //   color: ColorsValue.textColorCardMembership,
          //   elevation: 0,
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(10.0),
          //   ),
          //   child: Padding(
          //     padding: EdgeInsets.all(10),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Row(
          //           crossAxisAlignment: CrossAxisAlignment.center,
          //           children: [
          //             profileScreen.membershipType.value != "1" ?
          //             SvgPicture.asset(
          //               profileScreen.membershipType.value == "2" ?
          //               AssetsValue.memberSilverIcon :
          //               profileScreen.membershipType.value == "2" ?
          //               AssetsValue.memberGoldIcon :
          //               profileScreen.membershipType.value == "3" ?
          //               AssetsValue.memberPlatinumIcon :
          //               profileScreen.membershipType.value == "4" ?
          //               AssetsValue.memberDiamondIcon : "",
          //               height: 25.h,
          //               width: 25.w,
          //             ) : const SizedBox(),
          //             profileScreen.membershipType.value != "1" ?
          //             Gap(15.w) : const SizedBox(),
          //             Text(
          //               "Membership " + profileScreen.membershipTypeDesc.value,
          //               style: GoogleFonts.poppins(
          //                   fontSize: 20.sp,
          //                   color: Colors.white,
          //                   fontWeight: FontWeight.w600
          //               ),
          //             ),
          //           ],
          //         ),
          //         // Text(
          //         //   "${profileScreen.name}",
          //         //   style: GoogleFonts.poppins(
          //         //       fontSize: 20.sp,
          //         //       color: Colors.white,
          //         //       fontWeight: FontWeight.w500
          //         //   ),
          //         // ),
          //         Gap(35.h),
          //         Row(
          //           children: [
          //             Gap(10.w),
          //             Image.asset(
          //               AssetsValue.logo,
          //               height: 50.h,
          //               fit: BoxFit.fitWidth,
          //             ),
          //             Gap(5.w),
          //             Text(
          //               "Snapy",
          //               style: GoogleFonts.poppins(
          //                   fontSize: 25.sp,
          //                   color: Colors.white,
          //                   fontWeight: FontWeight.w700
          //               ),
          //             ),
          //             Text(
          //               profileScreen.memberType.value.toLowerCase() == "premium"?"Pass":"Reward",
          //               style: GoogleFonts.poppins(
          //                   fontSize: 25.sp,
          //                   color: ColorsValue.backgroundColor,
          //                   fontWeight: FontWeight.w600
          //               ),
          //             ),
          //           ],
          //         ),
          //         Gap(35.h),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Flexible(child: profileScreen.memberType.value.toLowerCase() == "premium"?
          //             Text(
          //               "Exp: ${profileScreen.expired}",
          //               style: GoogleFonts.poppins(
          //                   fontSize: 14.sp,
          //                   fontStyle: FontStyle.italic,
          //                   color: ColorsValue.backgroundWhite,
          //                   fontWeight: FontWeight.w400
          //               ),
          //             ):Container(), flex: 1,),
          //             Flexible(child: Text(
          //               "No: ${profileScreen.id}",
          //               style: GoogleFonts.poppins(
          //                   fontSize: 14.sp,
          //                   fontStyle: FontStyle.italic,
          //                   color: ColorsValue.backgroundWhite,
          //                   fontWeight: FontWeight.w400
          //               ),
          //             ), flex: 1,),
          //           ],
          //         )
          //       ],
          //     ),
          //   ),
          // ),
          Gap(10.h),
          Card(
            color: Colors.transparent,
            elevation: 0,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                gradient: ColorsValue.linearGradientCard1,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total transaksi kamu tahun ${profileScreen.userProfileData.value.year}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  Gap(10.h),
                  Text(
                    "${Functions.formatCurrency(profileScreen.userProfileData.value.totalTransactionThisYear ?? 0)} / ${profileScreen.userProfileData.value.totalQtyTransaction ?? 0}x transaksi",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ),
          ),
          Gap(15.h),
          profileScreen.userProfileData.value.nextMembership != ""
              ? Column(
                  children: [
                    Text(
                      "Transaksi "
                      "${Functions.formatCurrency(profileScreen.userProfileData.value.remainingTransaction ?? 0)} "
                      "/ ${profileScreen.userProfileData.value.remainingQtyTransaction ?? 0}x "
                      "lagi ke ${profileScreen.userProfileData.value.nextMembership} membership",
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    Gap(10.h),
                    LinearPercentIndicator(
                      // width: Get.width * 0.9,
                      animation: true,
                      lineHeight: 20.0.h,
                      animationDuration: 2000,
                      percent: Functions.calculatePercentage(
                          profileScreen.userProfileData.value
                                  .totalTransactionThisYear ??
                              0,
                          profileScreen
                                  .userProfileData.value.targetTransaction ??
                              0),
                      barRadius: Radius.circular(10.r),
                      linearGradient: ColorsValue.linearGradientProgress1,
                      padding: EdgeInsets.zero,
                      // trailing: const SizedBox(),
                      // trailing: profileScreen.membershipType.value != "1" && profileScreen.membershipType.value != "4" ?
                      // SvgPicture.asset(
                      //   profileScreen.membershipType.value == "2" ?
                      //   AssetsValue.memberGoldIcon :
                      //   profileScreen.membershipType.value == "2" ?
                      //   AssetsValue.memberPlatinumIcon :
                      //   profileScreen.membershipType.value == "3" ?
                      //   AssetsValue.memberDiamondIcon : "",
                      //   height: 25.h,
                      //   width: 25.w,
                      // ) : const SizedBox()
                    ),
                    Gap(20.h),
                  ],
                )
              : const SizedBox(),

          // Gap(10.h),
          // Text(
          //   "${profileScreen.name}",
          //   style: GoogleFonts.poppins(
          //       fontSize: 20.sp,
          //       color: Colors.white,
          //       fontWeight: FontWeight.w500
          //   ),
          // ),
          // Gap(5.h),
          // Text(
          //   "Buruan, segera berbelanja dengan ribuan orang yang sudah memiliki dan merasakan "
          //       "manfaat kartu snapy RewardPlus",
          //   style: GoogleFonts.poppins(
          //       fontSize: 13.sp,
          //       color: Colors.white,
          //       fontWeight: FontWeight.w400
          //   ),
          // ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    AssetsValue.startPointsIcon,
                    height: 15.h,
                    width: 15.w,
                    color: Colors.white,
                  ),
                  Gap(5.w),
                  Text(
                    "${profileScreen.userProfileData.value.point ?? 0} Points",
                    style: GoogleFonts.poppins(
                        fontSize: 11.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              GestureDetector(
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AssetsValue.shareIcon,
                      height: 15.h,
                      width: 15.w,
                      color: Colors.white,
                    ),
                    Gap(5.w),
                    Text(
                      "Share",
                      style: GoogleFonts.poppins(
                          fontSize: 11.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                onTap: () {
                  Share.share(
                      "Snapy Mobile App https://play.google.com/store/apps/details?id=com.edutekmedia.snapy");
                },
              )
            ],
          ),
          Gap(20.h),
        ],
      ),
    );
  }
}

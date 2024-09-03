import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markaz_snappy/config/config.dart';

import 'package:markaz_snappy/modules/HomeScreen/HomeScreen.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shimmer/shimmer.dart';

import '../config/assets.dart';
import '../config/colors.dart';
import '../routes/routes.dart';
import '../utils/function.dart';

class HomeScreen extends StatelessWidget {
  final HomeScreenController homeScreen;

  const HomeScreen(this.homeScreen, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Obx(() => !homeScreen.isLoading.value
            ? RefreshIndicator(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                  child: ListView(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child:
                                // Container(),
                                Text(
                              "Hi " +
                                  (homeScreen.userProfileData.value.loginName??"") +
                                  ", welcome to snapy",
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                          Image.asset(
                            AssetsValue.logo,
                            height: 25.h,
                            width: 25.w,
                          )
                        ],
                      ),
                      Gap(20.h),
                      _sliderBanner(),
                      Gap(20.h),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // Expanded(
                          //     flex: 1,
                          //     child: GestureDetector(
                          //       onTap: () {
                          //         // Get.toNamed(Routes.otpScreen);
                          //         homeScreen.token.value != ""
                          //             ? homeScreen.mainScreenController
                          //                 .navigationTapped(3)
                          //             : Get.offNamed(Routes.loginScreen);
                          //       },
                          //       child: Card(
                          //         elevation: 2,
                          //         color: ColorsValue.textColorCardMembership,
                          //         shape: RoundedRectangleBorder(
                          //           borderRadius: BorderRadius.circular(10.0),
                          //         ),
                          //         child: SizedBox(
                          //           height: 114.h,
                          //           child: ClipRRect(
                          //             borderRadius: BorderRadius.circular(10.0),
                          //             child: homeScreen.token.value == ""
                          //                 ? Image.asset(
                          //                     './assets/images/image_member_promo.jpg',
                          //                     fit: BoxFit.fill,
                          //                   )
                          //                 : Padding(
                          //               padding: EdgeInsets.all(5),
                          //               child: Column(
                          //                 crossAxisAlignment: CrossAxisAlignment.start,
                          //                 children: [
                          //                   Text(
                          //                     "${homeScreen.userName}",
                          //                     style: GoogleFonts.poppins(
                          //                         fontSize: 13.sp,
                          //                         color: Colors.white,
                          //                         fontWeight: FontWeight.w500
                          //                     ),
                          //                   ),
                          //                   Expanded(child: Row(
                          //                     children: [
                          //                       Gap(5.w),
                          //                       Image.asset(
                          //                         AssetsValue.logo,
                          //                         height: 20.h,
                          //                         fit: BoxFit.fitWidth,
                          //                       ),
                          //                       Gap(2.w),
                          //                       Text(
                          //                         "Snapy",
                          //                         style: GoogleFonts.poppins(
                          //                             fontSize: 15.sp,
                          //                             color: Colors.white,
                          //                             fontWeight: FontWeight.w700
                          //                         ),
                          //                       ),
                          //                       Text(
                          //                         homeScreen.memberType.value.toLowerCase() != "premium"?"Pass":"Reward",
                          //                         style: GoogleFonts.poppins(
                          //                             fontSize: 15.sp,
                          //                             color: ColorsValue.backgroundColor,
                          //                             fontWeight: FontWeight.w600
                          //                         ),
                          //                       ),
                          //                     ],
                          //                   ),),
                          //                   Row(
                          //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //                     children: [
                          //                       Flexible(child: homeScreen.memberType.value.toLowerCase() == "premium"?
                          //                       Text(
                          //                         "Exp: ${homeScreen.expired}",
                          //                         style: GoogleFonts.poppins(
                          //                             fontSize: 8.sp,
                          //                             fontStyle: FontStyle.italic,
                          //                             color: ColorsValue.backgroundWhite,
                          //                             fontWeight: FontWeight.w400
                          //                         ),
                          //                       ):Container(), flex: 1,),
                          //                       Flexible(child: Text(
                          //                         "No: ${homeScreen.id}",
                          //                         style: GoogleFonts.poppins(
                          //                             fontSize: 8.sp,
                          //                             fontStyle: FontStyle.italic,
                          //                             color: ColorsValue.backgroundWhite,
                          //                             fontWeight: FontWeight.w400
                          //                         ),
                          //                       ), flex: 1,),
                          //                     ],
                          //                   )
                          //                 ],
                          //               ),
                          //             ),
                          //           ),
                          //         ),
                          //       ),
                          //     )),
                          Expanded(
                              flex: 1,
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.branch);
                                },
                                child: Card(
                                  elevation: 2,
                                  color: ColorsValue.textColorD0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: SizedBox(
                                    height: 140.h,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image.asset(
                                        './assets/images/find_nearest_temp.jpg',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),),
                              )),
                          Gap(15.w),
                          Expanded(
                              flex: 1,
                              child: GestureDetector(
                                  onTap: () {
                                    Get.toNamed(Routes.productCategory);
                                  },
                                  child: Card(
                                    elevation: 2,
                                    color: ColorsValue.textColorD0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: SizedBox(
                                      height: 140.h,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        child: Image.asset(
                                          './assets/images/image_product_temp.jpg',
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ))),
                        ],
                      ),
                      Gap(20.h),
                      // Row(
                      //   mainAxisSize: MainAxisSize.max,
                      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //   children: [
                      //     Expanded(
                      //         flex: 1,
                      //         child: GestureDetector(
                      //           onTap: () {
                      //             Get.toNamed(Routes.branch);
                      //           },
                      //           child: Card(
                      //             elevation: 2,
                      //             color: ColorsValue.textColorD0,
                      //             shape: RoundedRectangleBorder(
                      //               borderRadius: BorderRadius.circular(10.0),
                      //             ),
                      //             child: SizedBox(
                      //             height: 114.h,
                      //             child: ClipRRect(
                      //               borderRadius: BorderRadius.circular(10.0),
                      //               child: Image.asset(
                      //                 './assets/images/find_nearest_temp.jpg',
                      //                 fit: BoxFit.fill,
                      //               ),
                      //             ),
                      //           ),),
                      //         )),
                      //     Gap(15.w),
                      //     Expanded(flex: 1, child: Container()),
                      //   ],
                      // ),
                      homeScreen.token.value != "" ?
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              homeScreen.userProfileData.value.nextMembership != "" ?
                              Column(
                                children: [
                                  Text("Transaksi "
                                      "${Functions.formatCurrency(
                                      homeScreen.userProfileData.value.remainingTransaction??0)} "
                                      "/ ${homeScreen.userProfileData.value.remainingQtyTransaction??0}x "
                                      "lagi ke ${homeScreen.userProfileData.value.nextMembership} membership",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white
                                    ),),
                                  Gap(15.h),
                                  LinearPercentIndicator(
                                    // width: Get.width * 0.9,
                                    animation: true,
                                    lineHeight: 20.0.h,
                                    animationDuration: 2000,
                                    percent: Functions.calculatePercentage(homeScreen.userProfileData.value.totalTransactionThisYear??0,
                                        homeScreen.userProfileData.value.targetTransaction??0),
                                    barRadius:  Radius.circular(10.r),
                                    linearGradient: ColorsValue.linearGradientProgress1,
                                    padding: EdgeInsets.zero,
                                    // trailing: CachedNetworkImage(
                                    //   height: 30.h,
                                    //   width: 30.w,
                                    //   imageUrl: "https://uatcms.snapyapp.id/storage/app/public/uploaded-image/YKNLTS6kGZheJz5smHBntoUvZKryiLVdCQyOt8cv.jpg",
                                    // ),
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
                              ) : const SizedBox(),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("10 Transaksi terakhir",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white
                                    ),),
                                  InkWell(
                                    onTap: () {
                                      homeScreen.mainScreenController.navigationTapped(1);
                                    },
                                    child: Text("Lihat semua",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white
                                      ),),
                                  )
                                ],
                              ),
                              Gap(15.h),
                              ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: homeScreen.listTransaction.length,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (BuildContext context, int index) {
                                    var dataView = homeScreen.listTransaction[index];
                                    return Card(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      color: ColorsValue.backgroundCard,
                                      elevation: 15,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 11.h, horizontal: 10.w),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Flexible(
                                                    flex: 1,
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons.date_range,
                                                          size: 16.r,
                                                          color: Colors.white,
                                                        ),
                                                        Gap(10.w),
                                                        Flexible(child: Text(
                                                          Functions.convertDateOnly(dataView.datetime??""),
                                                          style: TextStyle(
                                                              fontSize: 14.sp,
                                                              fontWeight: FontWeight.w400,
                                                              color: Colors.white
                                                          ),
                                                        ))
                                                      ],
                                                    )
                                                ),
                                                Gap(5.w),
                                                Flexible(
                                                    flex: 1,
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                      children: [
                                                        Text(
                                                          "Cabang: ",
                                                          style: TextStyle(
                                                              fontSize: 14.sp,
                                                              fontWeight: FontWeight.w400,
                                                              color: Colors.white
                                                          ),
                                                        ),
                                                        Flexible(child: Text(
                                                          "${dataView.cabang}",
                                                          textAlign: TextAlign.right,
                                                          style: TextStyle(
                                                              fontSize: 14.sp,
                                                              fontWeight: FontWeight.w400,
                                                              color: Colors.white
                                                          ),
                                                        ))
                                                      ],
                                                    )
                                                )
                                              ],
                                            ),
                                            Gap(10.h),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Flexible(child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      StringValue.transaksi,
                                                      maxLines: 1,
                                                      style: TextStyle(
                                                          fontSize: 14.sp,
                                                          fontWeight: FontWeight.w600,
                                                          color: Colors.white
                                                      ),
                                                    ),
                                                    Gap(5.h),
                                                    Text(
                                                      "Qty ${(dataView.totalTransaction??0).toString()}",
                                                      style: TextStyle(
                                                          fontSize: 14.sp,
                                                          fontWeight: FontWeight.w400,
                                                          color: Colors.white
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                  flex: 1,),
                                                Flexible(child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      StringValue.amount,
                                                      textAlign: TextAlign.right,
                                                      maxLines: 1,
                                                      style: TextStyle(
                                                          fontSize: 14.sp,
                                                          fontWeight: FontWeight.w600,
                                                          color: Colors.white
                                                      ),
                                                    ),
                                                    Gap(5.h),
                                                    Text(
                                                      Functions.formatCurrency(dataView.totalAmount??0),
                                                      textAlign: TextAlign.right,
                                                      style: TextStyle(
                                                          fontSize: 14.sp,
                                                          fontWeight: FontWeight.w400,
                                                          color: Colors.white
                                                      ),
                                                    ),
                                                  ],
                                                ), flex: 1,),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ],
                          ) : const SizedBox(),
                      // Text(
                      //   "You have (2) Notifications",
                      //   style: GoogleFonts.poppins(
                      //       fontSize: 14.sp,
                      //       fontWeight: FontWeight.w500,
                      //       color: ColorsValue.textColor00),
                      // ),
                      // Gap(10.h),
                      // ListView.builder(
                      //     shrinkWrap: true,
                      //     physics: const NeverScrollableScrollPhysics(),
                      //     itemCount: homeScreen.dataNotifications?.length,
                      //     itemBuilder: (BuildContext context, int index) {
                      //       var entry = homeScreen.dataNotifications?[index];
                      //       return Padding(padding:
                      //       EdgeInsets.symmetric(vertical: 5.h),
                      //       child: Text(
                      //         entry??"",
                      //         style: GoogleFonts.poppins(
                      //             fontSize: 12.sp, color: Colors.grey, fontWeight: FontWeight.w500),
                      //       ),
                      //       );
                      //     }),
                    ],
                  ),
                ),
                onRefresh: () => homeScreen.getData())
            : Shimmer.fromColors(
                period: const Duration(milliseconds: 2500),
                baseColor: const Color(0xffAAAAAA),
                highlightColor: const Color(0xffC1C7D0),
                enabled: homeScreen.isLoading.value,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Gap(10.h),
                    Container(
                      color: Colors.white,
                      height: 96.h,
                      padding: EdgeInsets.only(right: 30.w, left: 30.w),
                    ),
                    Gap(15.h),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 7.w),
                        child: Container(
                          color: Colors.white,
                          height: 91.h,
                        )),
                    Gap(32.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 114.h,
                            width: 106.69.w,
                            child: Card(
                              color: Colors.white,
                              elevation: 15,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(height: 38.h, width: 37.89.w),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 114.h,
                            width: 106.69.w,
                            child: Card(
                              color: Colors.white,
                              elevation: 15,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(height: 38.h, width: 37.89.w),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 114.h,
                            width: 106.69.w,
                            child: Card(
                              color: Colors.white,
                              elevation: 15,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(height: 38.h, width: 37.89.w),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Gap(20.h),
                    Card(
                      color: Colors.white,
                      elevation: 15,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 50.h,
                          ),
                        ],
                      ),
                    ),
                    Gap(20.h),
                    Card(
                      color: Colors.white,
                      elevation: 15,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 50.h,
                          ),
                        ],
                      ),
                    ),
                    Gap(20.h),
                    Card(
                      color: Colors.white,
                      elevation: 15,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 50.h,
                          ),
                        ],
                      ),
                    ),
                    Gap(50.h)
                  ],
                ),
              )));
  }

  _sliderBanner() {
    return Column(
      children: [
        CarouselSlider(
            options: CarouselOptions(
                viewportFraction: 1,
                enlargeCenterPage: true,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                autoPlayAnimationDuration: const Duration(milliseconds: 1000),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
                height: 160.h,
                onPageChanged: (index, reason) {
                  homeScreen.currentIndexBanner.value = index;
                }),
            items: homeScreen.listBanners.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                    child: CachedNetworkImage(
                        width: Get.width,
                        imageUrl:
                            // "https://cdn.pixabay.com/photo/2018/03/17/20/51/white-buildings-3235135__340.jpg",
                            i.image ??
                                "https://cdn.pixabay.com/photo/2018/03/17/20/51/white-buildings-3235135__340.jpg",
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        fit: BoxFit.fill),
                  );
                },
              );
            }).toList()),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: homeScreen.listBanners.map((i) {
            int index = homeScreen.listBanners.indexOf(i);
            return Container(
              width: 8.w,
              height: 8.h,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: homeScreen.currentIndexBanner.value == index
                    ? ColorsValue.backgroundColor
                    : Colors.grey[400],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

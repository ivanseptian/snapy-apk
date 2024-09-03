import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:markaz_snappy/config/assets.dart';
import 'package:markaz_snappy/config/colors.dart';
import 'package:markaz_snappy/modules/Notification/notification.dart';
import 'package:markaz_snappy/utils/function.dart';
import 'package:shimmer/shimmer.dart';

class NotificationScreen extends StatelessWidget {
  final NotificationController controller;

  const NotificationScreen(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() => !controller.isLoading.value
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Image.asset(
                    AssetsValue.logo,
                    height: 25.h,
                    width: 25.w,
                  ),
                ),
                Gap(15.h),
                Expanded(
                    child: RefreshIndicator(
                        child: ListView.builder(
                            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                            itemCount: controller.listNotifications.length,
                            itemBuilder: (BuildContext context, int index) {
                              var dataView =
                                  controller.listNotifications[index];
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
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SvgPicture.asset(
                                        AssetsValue.infoIcon,
                                        height: 30.h,
                                        width: 30.w,
                                      ),
                                      Gap(15.w),
                                      Expanded(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            dataView.title??"-",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16.sp,
                                            ),
                                          ),
                                          Gap(5.h),
                                          Text(
                                            dataView.content??"-",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14.sp,
                                            ),
                                          ),
                                          Gap(5.h),
                                          Text(
                                            Functions.formatDateDifference(dataView.datetime??""),
                                            style: TextStyle(
                                              color: ColorsValue.textColorD0,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12.sp,
                                            ),
                                          ),
                                        ],
                                      ))
                                    ],
                                  ),
                                ),
                              );
                            }),
                        onRefresh: () => controller.getData())),
                Gap(15.h),
              ],
            )
          : Shimmer.fromColors(
              period: const Duration(milliseconds: 2500),
              baseColor: const Color(0xffAAAAAA),
              highlightColor: const Color(0xffC1C7D0),
              enabled: controller.isLoading.value,
              child: ListView(
                children: [
                  Gap(30.h),
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
                ],
              ),
            )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:markaz_snappy/config/assets.dart';
import 'package:markaz_snappy/config/colors.dart';
import 'package:markaz_snappy/modules/Transaction/transaction.dart';
import 'package:markaz_snappy/utils/function.dart';
import 'package:shimmer/shimmer.dart';

import '../config/strings.dart';

class TransactionScreen extends StatelessWidget {
  final TransactionController controller;

  const TransactionScreen(this.controller, {Key? key}) : super(key: key);

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
                            controller: controller.scrollController,
                            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                            itemCount: controller.listTransaction.length,
                            itemBuilder: (BuildContext context, int index) {
                              var dataView = controller.listTransaction[index];
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

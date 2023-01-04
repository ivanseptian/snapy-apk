import 'dart:ffi';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:markaz_snappy/modules/Branch/Branch.dart';
import 'package:url_launcher/url_launcher.dart';

import '../config/assets.dart';
import '../config/colors.dart';

class Branch extends StatelessWidget {
  final BranchController branch;

  const Branch(this.branch, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsValue.backgroundWhite,
      body: SafeArea(
        child: Column(
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
                    onTap: () {
                      Get.back();
                    },
                  ),
                  Text(
                    "Lokasi Cabang",
                    style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        color: ColorsValue.textColor00,
                        fontWeight: FontWeight.w500),
                  ),
                  Container()
                ],
              ),
            ),
            Gap(20.h),
            Expanded(child: Obx(() => ListView.builder(
                itemCount: branch.listBranch.length,
                itemBuilder: (BuildContext context, int index) {
                  var dataView = branch.listBranch[index];
                  return GestureDetector(
                    child: Card(
                      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                      color: Colors.white,
                      child: SizedBox(
                        width: Get.width,
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            ClipRRect(
                              child: CachedNetworkImage(
                                  imageUrl:
                                  // "https://cdn.pixabay.com/photo/2018/03/17/20/51/white-buildings-3235135__340.jpg",
                                  dataView.image ??
                                      "https://cdn.pixabay.com/photo/2018/03/17/20/51/white-buildings-3235135__340.jpg",
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(),
                                  errorWidget:
                                      (context, url, error) =>
                                  const Icon(Icons.error),
                                  width: Get.width,
                                  fit: BoxFit.fitWidth),
                            ),
                            Padding(padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${dataView.branchName}",
                                      style: GoogleFonts.poppins(
                                          fontSize: 12.0.sp,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      "+62${dataView.mobileNumber}",
                                      style: GoogleFonts.poppins(
                                          fontSize: 12.0.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.0.h,
                                ),
                                Text(
                                  "${dataView.locAddress} - ${dataView.locCity}",
                                  style: GoogleFonts.roboto(
                                      fontSize: 12.0.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      child: SvgPicture.asset(
                                        AssetsValue.mapsIcon,
                                        height: 30.h,
                                        width: 30.w,
                                      ),
                                      onTap: (){
                                        _navigateTo(double.parse(dataView.locLatitude??"0.0"), double.parse(dataView.locLongtitude??"0.0"));
                                      },
                                    ),
                                    Gap(
                                      10.h
                                    ),
                                    GestureDetector(
                                      child: SvgPicture.asset(
                                        AssetsValue.whatsappIcon,
                                        height: 30.h,
                                        width: 30.w,
                                      ),
                                      onTap: (){
                                        _launchWhatsapp(dataView.whatsapp??"");
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),)
                          ],
                        ),
                      ),
                    ),
                    onTap: () {

                    },
                  );
                })))
          ],
        ),
      ),
    );
  }

  _navigateTo(double lat, double lng) async {
    var uri = Uri.parse("google.navigation:q=$lat,$lng&mode=d");
    if (await canLaunch(uri.toString())) {
      await launch(uri.toString());
    } else {
      throw 'Could not launch ${uri.toString()}';
    }
  }

  _launchWhatsapp(String phoneNumber) async {

    var whatsapp = "+62$phoneNumber";
    var whatsappAndroid =Uri.parse("whatsapp://send?phone=$whatsapp&text=hello");
    // var whatsappAndroid = "";
    // if (Platform.isIOS) {
    //   whatsappAndroid = "https://wa.me/$whatsapp/?text=${Uri.parse("")}";
    // } else {
    //   whatsappAndroid = "https://api.whatsapp.com/send?phone=$whatsapp&${Uri.parse("")}";
    // }
    if (await canLaunchUrl(whatsappAndroid)) {
      await launchUrl(whatsappAndroid);
    } else {
      const SnackBar(
        content: Text("WhatsApp is not installed on the device"),
      );
    }
  }

}

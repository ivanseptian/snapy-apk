import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/io_client.dart';

import 'package:markaz_snappy/modules/ProductCategory/ProductCategory.dart';
import 'package:markaz_snappy/routes/routes.dart';

import '../config/assets.dart';
import '../config/colors.dart';

class ProductCategory extends StatelessWidget {
  final ProductCategoryController productCategory;

  const ProductCategory(this.productCategory, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsValue.backgroundWhite,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    "Product Category",
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
            Expanded(
                child: Obx(() => GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            // banyak grid yang ditampilkan dalam satu baris
                            crossAxisCount: 2),
                    itemCount: productCategory.listCategory.length,
                    itemBuilder: (BuildContext context, int index) {
                      var dataView = productCategory.listCategory[index];

                      return Padding(
                          padding: EdgeInsets.all(10),
                          child: GestureDetector(
                            onTap: () => {
                              Get.toNamed(Routes.product, arguments: [
                                dataView.id.toString(),
                                dataView.categoryName ?? ""
                              ])
                            },
                            child: Card(
                                color: Colors.white,
                                elevation: 2,
                                child: CachedNetworkImage(
                                    imageUrl:
                                    // "https://cdn.pixabay.com/photo/2018/03/17/20/51/white-buildings-3235135__340.jpg",
                                    dataView.image ??
                                        "https://cdn.pixabay.com/photo/2018/03/17/20/51/white-buildings-3235135__340.jpg",
                                    placeholder: (context, url) =>
                                        CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                    fit: BoxFit.cover),
                                // Column(
                                //   children: [
                                //     Flexible(child: CachedNetworkImage(
                                //         imageUrl:
                                //         // "https://cdn.pixabay.com/photo/2018/03/17/20/51/white-buildings-3235135__340.jpg",
                                //         dataView.image ??
                                //             "https://cdn.pixabay.com/photo/2018/03/17/20/51/white-buildings-3235135__340.jpg",
                                //         placeholder: (context, url) =>
                                //             CircularProgressIndicator(),
                                //         errorWidget: (context, url, error) =>
                                //         const Icon(Icons.error),
                                //         fit: BoxFit.cover)),
                                //     Padding(
                                //       padding: const EdgeInsets.all(8.0),
                                //       child: Text(
                                //         dataView.categoryName ?? "",
                                //         style: GoogleFonts.poppins(
                                //           fontSize: 12.sp,
                                //           color: Colors.black,
                                //         ),
                                //         maxLines: 3,
                                //         overflow: TextOverflow.ellipsis,
                                //       ),
                                //     )
                                //   ],
                                // )
                            ),
                          ));
                    }))),
          ],
        ),
      ),
    );
  }
}

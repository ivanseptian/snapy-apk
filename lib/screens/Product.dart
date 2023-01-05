import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:markaz_snappy/modules/Product/Product.dart';

import '../config/assets.dart';
import '../config/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class Product extends StatelessWidget {
  final ProductController product;

  const Product(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
                      color: Colors.white,
                    ),
                    onTap: () {
                      Get.back();
                    },
                  ),
                  Text(
                    Get.arguments[1],
                    style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        color: Colors.white,
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
                    itemCount: product.listProduct.length,
                    itemBuilder: (BuildContext context, int index) {
                      var dataView = product.listProduct[index];

                      return Padding(
                          padding: EdgeInsets.all(10),
                          child: GestureDetector(
                            child: Card(
                                elevation: 2,
                                color: Colors.white,
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
                                //     CachedNetworkImage(
                                //         imageUrl:
                                //             // "https://cdn.pixabay.com/photo/2018/03/17/20/51/white-buildings-3235135__340.jpg",
                                //         dataView.image ??
                                //             "https://cdn.pixabay.com/photo/2018/03/17/20/51/white-buildings-3235135__340.jpg",
                                //         placeholder: (context, url) =>
                                //             CircularProgressIndicator(),
                                //         errorWidget: (context, url, error) =>
                                //             const Icon(Icons.error),
                                //         fit: BoxFit.cover),
                                //     Padding(
                                //       padding: const EdgeInsets.all(8.0),
                                //       child: Text(
                                //         dataView.productName ?? "",
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
                            onTap: () =>
                                {_launchURL(dataView.productURLs ?? "")},
                          ));
                    }))),
          ],
        ),
      ),
    );
  }

  _launchURL(String url) async {
    // const url = 'https://flutter.io';
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}

import 'package:colour/colour.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markaz_snappy/modules/HelpScreen/HelpScreen.dart';
import 'package:markaz_snappy/modules/HomeScreen/HomeScreen.dart';

import 'package:markaz_snappy/modules/MainScreen/MainScreen.dart';
import 'package:markaz_snappy/modules/ProfileScreen/ProfileScreen.dart';
import 'package:markaz_snappy/modules/history/history.dart';
import 'package:markaz_snappy/modules/history/history_controller.dart';
import 'package:markaz_snappy/screens/HelpScreen.dart';
import 'package:markaz_snappy/screens/HomeScreen.dart';
import 'package:markaz_snappy/screens/ProfileScreen.dart';
import 'package:markaz_snappy/screens/history.dart';

import '../config/assets.dart';
import '../config/colors.dart';
import '../config/strings.dart';
import '../routes/routes.dart';
import '../widgets/dialog.dart';

class MainScreen extends StatelessWidget {
  final MainScreenController mainScreenController;

  const MainScreen(this.mainScreenController, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          backgroundColor: ColorsValue.backgroundWhite,
          body: Stack(
            children: [
              PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: mainScreenController.pageController,
                onPageChanged: mainScreenController.onPageChanged,
                children: <Widget>[
                  HomeScreen(Get.put(HomeScreenController(HomeScreenService()))),
                  // History(Get.put(HistoryController(HistoryService()))),
                  HelpScreen(Get.put(HelpScreenController(HelpScreenService()))),
                  ProfileScreen(Get.put(ProfileScreenController(ProfileScreenService()))),
                ],
              ),
            ],
          ),
          bottomNavigationBar: Obx(() => BottomNavigationBar(
            selectedLabelStyle: GoogleFonts.poppins(
              color: ColorsValue.backgroundColor,
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
            ),
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: const Color(0xffDADADA),
            selectedItemColor: ColorsValue.backgroundColor,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  AssetsValue.homeActive,
                  height: 20.h,
                  width: 20.w,
                ),
                icon: SvgPicture.asset(
                  AssetsValue.homeInactive,
                  height: 20.h,
                  width: 20.w,
                ),
                label: StringValue.homeTxt,
              ),
              // BottomNavigationBarItem(
              //   activeIcon: SvgPicture.asset(
              //     AssetsValue.historyActive,
              //     height: 20.h,
              //     width: 20.w,
              //   ),
              //   icon: SvgPicture.asset(
              //     AssetsValue.historyInactive,
              //     height: 20.h,
              //     width: 20.w,
              //   ),
              //   label: StringValue.historyTxt,
              // ),
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  AssetsValue.helpActive,
                  height: 20.h,
                  width: 20.w,
                ),
                icon: SvgPicture.asset(
                  AssetsValue.helpInactive,
                  height: 20.h,
                  width: 20.w,
                ),
                label: StringValue.helpTxt,
              ),
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  AssetsValue.profileActive,
                  height: 15.h,
                  width: 15.w,
                ),
                icon: SvgPicture.asset(
                  AssetsValue.profileInactive,
                  height: 15.h,
                  width: 15.w,
                ),
                label: StringValue.accountTxt,
              ),
            ],
            currentIndex: mainScreenController.indexButtonNavigation.value,
            showUnselectedLabels: true,
            elevation: 15,
            onTap: (index) {
              print("debug: $index");
              if(index == 2 && mainScreenController.token.value == "") {
                Get.offNamed(Routes.loginScreen);
              } else {
                mainScreenController.navigationTapped(index);
              }
            },
          )),
        ),
        onWillPop: () => Dialogs().showExitDialog1(context));
  }
}
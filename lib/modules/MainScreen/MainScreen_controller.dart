import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:markaz_snappy/modules/HomeScreen/HomeScreen.dart';

import 'package:markaz_snappy/modules/MainScreen/MainScreen.dart';
import 'package:markaz_snappy/modules/Notification/notification.dart';
import 'package:markaz_snappy/modules/Transaction/transaction.dart';

import '../../config/strings.dart';
import '../../utils/prefs.dart';

class MainScreenController extends GetxController {

  final MainScreenService _service;

  MainScreenController(this._service);

  var indexButtonNavigation = 0.obs;
  var token = "".obs;
  late PageController pageController;

  @override
  void onInit() {
    _init();
    super.onInit();

  }
  @override
  void onClose() {
    super.onClose();
    pageController.dispose();
  }

  Future<void> _init()  async {
    pageController = PageController(initialPage: 0);
    String? token = await Prefs.getString(StringValue.sessionTokenStr);
    String? isTokenVerified = await Prefs.getString(StringValue.sessionTokenIsVerified);
    if (isTokenVerified == "1") {
      this.token.value = token??"";
    }
    String? checkIsNotification = await Prefs.getString("notification");
    if (checkIsNotification != null && checkIsNotification.isNotEmpty) {
      if (checkIsNotification == "1" && this.token.value.isNotEmpty) {
        Prefs.remove("notification");
        navigationTapped(2);
      }
    }
  }
  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }
  void onPageChanged(int page) {
    indexButtonNavigation.value = page;
    if(page == 0) {
      Get.find<HomeScreenController>().getData();
    } else if(page == 1) {
      Get.find<TransactionController>().getData();
    } else if(page == 2) {
      Get.find<NotificationController>().getData();
    }
  }

}
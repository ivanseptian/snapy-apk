import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:markaz_snappy/modules/HomeScreen/HomeScreen.dart';

import 'package:markaz_snappy/modules/MainScreen/MainScreen.dart';

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

  Future<void> _init() async {
    pageController = PageController(initialPage: 0);
    String? token = await Prefs.getString(StringValue.sessionTokenStr);
    this.token.value = token??"";
  }
  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }
  void onPageChanged(int page) {
    indexButtonNavigation.value = page;
    if(page == 0) {
      Get.find<HomeScreenController>().getData();
    } else if(page == 1) {

    }
  }

}
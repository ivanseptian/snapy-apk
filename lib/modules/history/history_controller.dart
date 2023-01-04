import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:markaz_snappy/modules/history/history.dart';

class HistoryController extends GetxController with
    GetSingleTickerProviderStateMixin {

  final HistoryService _service;

  HistoryController(this._service);

  late TabController tabController;
  var indexTab = 0.obs;

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

}
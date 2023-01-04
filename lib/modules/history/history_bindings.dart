import 'package:get/get.dart';

import 'package:markaz_snappy/modules/history/history.dart';

class HistoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HistoryController(HistoryService()));
  }
}
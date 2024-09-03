import 'package:get/get.dart';
import 'package:markaz_snappy/modules/Notification/notification_controller.dart';

import 'notification_service.dart';

class NotificationBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationController(NotificationService()));
  }
}
import 'package:get/get.dart';
import 'package:markaz_snappy/models/notification_model.dart';

import '../../config/strings.dart';
import '../../utils/function.dart';
import '../../utils/prefs.dart';
import 'notification_service.dart';

class NotificationController extends GetxController {

  final NotificationService _notificationService;

  NotificationController(this._notificationService);

  var isLoading = false.obs;
  var listNotifications = <notification_model>[].obs;

  @override
  Future<void> onReady() async {
    isLoading.value = false;
    String token = await Prefs.getString(StringValue.sessionTokenStr)??"";
    String? isTokenVerified = await Prefs.getString(StringValue.sessionTokenIsVerified);
    if (isTokenVerified == "1") {
      if (token.isNotEmpty) {
        getData();
      }
    }
    super.onReady();
  }

  // @override
  // Future<void> onInit() async {
  //   await Future.delayed(const Duration(seconds: 2));
  //
  //   super.onInit();
  // }

  Future<void> getData() async{
    try {
      isLoading.value = true;
      List<notification_model>? notifications = await _notificationService.notifications();
      isLoading.value = false;
      if(notifications!=null) {
        listNotifications.value = notifications;
      } else {
        // Functions.checkErrorPopup("");
      }
    } catch (e) {
      isLoading.value = false;
      Functions.checkErrorPopup(e);
    }
  }

}
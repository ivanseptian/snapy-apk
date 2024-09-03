import 'package:markaz_snappy/models/notification_model.dart';

import '../../data/network/api.dart';

class NotificationService {

  Future<List<notification_model>?> notifications() async {
    var res = await Api.notificationData();
    try {
      List<notification_model> dataJson;
      dataJson = List<notification_model>.from(res.map((model)=> notification_model.fromJson(model)));

      return dataJson;
    } catch (e) {
      print("notifications: "+e.toString());
      return null;
    }
  }

}
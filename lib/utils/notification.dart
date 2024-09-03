import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:markaz_snappy/routes/routes.dart';
import 'package:markaz_snappy/utils/prefs.dart';

class Notifications {

  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  static int id = 0;

  static Future<void> showNotification(RemoteMessage message) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      'message_channel',
      'Message Notifications',
      channelDescription: 'Channel for displaying message notifications',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: true,
      channelShowBadge: true,
      enableLights: true,
      enableVibration: true,
      playSound: true,
    );

    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      id++,
      message.notification?.title,
      message.notification?.body,
      platformChannelSpecifics,
      payload: message.data.toString(),
    );
  }

  static void initializeNotifications() {

    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_notification');

    const IOSInitializationSettings iosInitializationSettings =
    IOSInitializationSettings(
      defaultPresentAlert: true,
      defaultPresentBadge: true,
      defaultPresentSound: true,
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true
    );

    InitializationSettings? initializationSettings;

    if(Platform.isAndroid) {
      initializationSettings =
          const InitializationSettings(android: initializationSettingsAndroid);
    } else if(Platform.isIOS) {
      initializationSettings =
      const InitializationSettings(iOS: iosInitializationSettings);
    }
    if(initializationSettings != null) {
      flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onSelectNotification: (String? payload) async {
          // Handle notification tap event when the app is in the foreground or terminated
          // You can navigate to a specific screen or handle the notification payload
          // based on your app's requirements
          debugPrint("tap notif2 $payload");
          Prefs.setString("notification", "1");
          Get.offAllNamed(Routes.root);
        },
      );
    }
  }

}
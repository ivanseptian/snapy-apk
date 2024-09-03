import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:markaz_snappy/app.dart';
import 'package:markaz_snappy/firebase_options.dart';
import 'package:markaz_snappy/routes/routes.dart';
import 'package:markaz_snappy/utils/notification.dart';
import 'package:markaz_snappy/utils/prefs.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Notifications.initializeNotifications();

  FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // Add your notification handling code here
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    // Handle incoming message when the app is in the foreground
    if(Platform.isAndroid) {
      Notifications.showNotification(message);
    }
  });

  // Add your notification handling code here
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    // Handle incoming message when the app is in the background or terminated
    // You can navigate to a specific screen or handle the notification payload
    // based on your app's requirements
    Prefs.setString("notification", "1");
    Get.offAllNamed(Routes.root);
    debugPrint("anroid notif on app open ${message.data}");
  });


  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    HttpOverrides.global = MyHttpOverrides();
    runApp(const App());
  });
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Prefs.setString("notification", "1");
  debugPrint('Handling a background message: ${message.messageId}');
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
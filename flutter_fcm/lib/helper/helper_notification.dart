import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_local_notifications/src/flutter_local_notifications_plugin.dart';

class HelperNotification {
  //Method 1
  static Future<void> initialize(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    //field
    var androidInitialize = AndroidInitializationSettings('notification_icon');
    var initializationsSettings =
        InitializationSettings(android: androidInitialize);
    //function
    // flutterLocalNotificationsPlugin.initialize(initializationSettings,
    //     onSelectNotification: (String? payload) async {
    //   try {
    //     if (payload != null && payload.isNotEmpty) {
    //       //route
    //     } else {
    //       //route
    //     }
    //   } catch (e) {}
    //   return;
    // });
    //
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    //
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("..........onMessage..........");
      print("onMessage: ${message.notification!.title}");
      //
      HelperNotification.showNotification(
        message,
        flutterLocalNotificationsPlugin,
        false,
      );
      //condition (optional)
    });
  }

  static void showNotification(
      RemoteMessage message,
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
      bool bool) {}
}

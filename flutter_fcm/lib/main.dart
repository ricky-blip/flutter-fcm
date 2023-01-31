import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fcm/helper/helper_notification.dart';
import 'package:flutter_fcm/services/local_notification_services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'firebase_options.dart';
import 'presentation/app_widget.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

//function untuk background notification
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('melisten Background Notification');
  print(message.notification);
  print(message.notification!.title);
}

//Memanggil Plugin Local Notification
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await permissionRequest();
  //untuk local notification
  LocalNotificationServices.initialize();
  //untuk background notification dengan memanggil function
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(const MyApp());
}

Future<void> permissionRequest() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted permission');
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    print('User granted provisional permission');
  } else {
    print('User declined or has not accepted permission');
  }
}

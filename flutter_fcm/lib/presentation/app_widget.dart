import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fcm/presentation/home_page.dart';
import 'package:flutter_fcm/services/local_notification_services.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    //SECTION ini akan melisten notifikasi

    //NOTE - menggunakan on Terminate (ketika notifikasi di klik)
    FirebaseMessaging.instance.getInitialMessage().then((value) {
      if (value != null) {
        //jika ada data notif masuk
        print('notif Terminate!');
        print(value.notification!.title);
      }
    });

    //NOTE - menggunakan on Background (ketika notifikasi di klik)
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      if (event.notification != null) {
        //ada notifikasi masuk
        print('notif Background!');
        print(event.notification!.title);
      }
    });

    // //NOTE - menggunakan on Foreground
    FirebaseMessaging.onMessage.listen((event1) {
      if (event1.notification != null) {
        //ada notifikasi masuk
        print('notif Foreground!');
        print(event1.notification!.title);
        LocalNotificationServices.createNotification(event1);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter FCM',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: const HomePage(),
      debugShowMaterialGrid: false,
    );
  }
}

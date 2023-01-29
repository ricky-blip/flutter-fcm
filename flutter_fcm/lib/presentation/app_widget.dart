import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fcm/presentation/home_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    //SECTION ini akan melisten notifikasi
    //NOTE menggunakan Foreground
    FirebaseMessaging.onMessage.listen((event) {
      if (event.notification != null) {
        //ada notifikasi masuk
        print(event.notification!.title);
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

import 'package:flutter/material.dart';
import 'package:flutter_fcm/presentation/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter FCM',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: const HomePage(),
      debugShowMaterialGrid: false,
    );
  }
}

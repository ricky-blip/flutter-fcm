import 'package:flutter/material.dart';

class FcmReceiverPage extends StatefulWidget {
  const FcmReceiverPage({super.key});

  @override
  State<FcmReceiverPage> createState() => _FcmReceiverPageState();
}

class _FcmReceiverPageState extends State<FcmReceiverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text("Fcm Receiver"),
      ),
    );
  }
}

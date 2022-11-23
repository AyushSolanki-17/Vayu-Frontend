import 'package:flutter/material.dart';
import 'package:vayu/screens/abg_test/abg_test.dart';
import 'package:vayu/screens/home_screen/home_screen.dart';
import 'package:vayu/screens/kommunicate_chatbot/chatbot.dart';
import 'package:vayu/screens/xray_test/xray_upload.dart';

void main() {
  runApp(const VayuApp());
}

class VayuApp extends StatelessWidget{
  const VayuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'VAYU',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
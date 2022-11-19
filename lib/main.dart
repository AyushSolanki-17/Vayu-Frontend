import 'package:flutter/material.dart';
import 'package:vayu/screens/home_screen/home_screen.dart';

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
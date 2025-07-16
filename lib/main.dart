import 'package:flutter/material.dart';
import 'package:visa_arapiraca_app/pages/home/dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "VISA ARAPIRACA",
      home: Dashboard(),
      debugShowCheckedModeBanner: false,
    );
  }
}

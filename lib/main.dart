import 'package:flutter/material.dart';
import 'package:visa_arapiraca_app/routes/app_router.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: "VISA ARAPIRACA",
      debugShowCheckedModeBanner: false,
    );
  }
}

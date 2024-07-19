import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'container_page.dart';
import 'landing_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final myapp = GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      home: const LandingPage(),
      getPages: [
        GetPage(name: '/', page: () => const ScreenContainer()),
        GetPage(name: '/ScreenContainer', page: () => const ScreenContainer()),
      ],
    );

    return myapp;
  }
}

void main() async => runApp(const MyApp());

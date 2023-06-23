import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_flutter/container_page.dart';
import 'package:hello_flutter/landing_page.dart';
import 'package:hello_flutter/utils/permission_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final permissionManager = PermissionManager();
    permissionManager.checkRequestNotificationPermission();

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

void main() {
  runApp(const MyApp());
}

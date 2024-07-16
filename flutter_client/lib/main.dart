import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: unused_import
import 'package:permission_handler/permission_handler.dart';
import 'container_page.dart';
import 'landing_page.dart';

// Future<void> _requestPermissions() async {
//   // final statusSMS = await Permission.sms.request(); // request permission

//   // if (statusSMS.isDenied) {
//   //   if (await Permission.sms.request().isGranted) {
//   //     debugPrint('SMS permission granted'); // permission granted
//   //   } else {
//   //     debugPrint('SMS permission denied'); // permission denied
//   //   }
//   // }

//   // if (statusSMS.isPermanentlyDenied) {
//   //   openAppSettings(); // permission denied
//   // }

//   final statusNOTI = await Permission.notification.request();

//   if (statusNOTI.isDenied) {
//     if (await Permission.notification.request().isGranted) {
//       debugPrint('Notification permission granted');
//     } else {
//       debugPrint('Notification permission denied');
//     }
//   }

//   // if (statusSMS.isPermanentlyDenied || statusNOTI.isPermanentlyDenied) {
//   if (statusNOTI.isPermanentlyDenied) {
//     openAppSettings();
//   }
// }

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

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await _requestPermissions();
  runApp(const MyApp());
}

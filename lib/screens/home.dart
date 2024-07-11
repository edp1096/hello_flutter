import 'package:flutter/material.dart';
import 'package:hello_flutter/utils/notification.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    FlutterLocalNotification.init();
    Future.delayed(const Duration(seconds: 3),
        FlutterLocalNotification.requestNotificationPermission());
  }

  @override
  Widget build(BuildContext context) {
    var container = Container(
      color: Colors.amber,
      child: Column(
        children: [
          const Text("홈 본문"),
          TextButton(
            onPressed: () => FlutterLocalNotification.showNotification(),
            child: const Text("알림 보내기"),
          )
        ],
      ),
    );

    return container;
  }
}

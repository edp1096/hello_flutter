import 'package:flutter/material.dart';

class MyPageScreen extends StatefulWidget {
  const MyPageScreen({super.key});

  @override
  State<MyPageScreen> createState() => _MyPageScreenState();
}

class _MyPageScreenState extends State<MyPageScreen> {
  @override
  Widget build(BuildContext context) {
    final scaffold = Container(
        color: Colors.amber,
        child: const Column(
          children: [
            Text("마이페이지 본문"),
            Text("안녕하세요."),
            Text("반갑습니다."),
          ],
        ));

    return scaffold;
  }
}

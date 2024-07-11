import 'package:flutter/material.dart';
import 'package:hello_flutter/screens/home.dart';
import 'package:hello_flutter/screens/camera.dart';
import 'package:hello_flutter/screens/webview.dart';
import 'package:hello_flutter/screens/mypage.dart';

class ScreenContainer extends StatefulWidget {
  const ScreenContainer({super.key});

  @override
  State<ScreenContainer> createState() => _ScreenContainerState();
}

class _ScreenContainerState extends State<ScreenContainer> {
  int _selectedIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      label: '홈',
      icon: Icon(Icons.home_filled),
    ),
    const BottomNavigationBarItem(
      label: '웹보기',
      icon: Icon(Icons.web_stories),
    ),
    const BottomNavigationBarItem(
      label: '사진기',
      icon: Icon(Icons.camera_alt),
    ),
    const BottomNavigationBarItem(
      label: '내 페이지',
      icon: Icon(Icons.account_circle),
    ),
  ];

  List pages = [
    const HomeScreen(),
    const WebViewScreen(),
    const CameraScreen(),
    const MyPageScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    // final appbar = AppBar(title: const Text('Main Page'));

    final botNavBar = BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey.withOpacity(.60),
      selectedFontSize: 14,
      unselectedFontSize: 10,
      currentIndex: _selectedIndex,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      items: bottomItems,
    );

    final scaffold = Scaffold(
      // appBar: appbar,
      bottomNavigationBar: botNavBar,
      body: Column(children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).padding.top,
          color: Colors.transparent,
        ),
        pages[_selectedIndex],
      ]),
    );

    return scaffold;
  }
}

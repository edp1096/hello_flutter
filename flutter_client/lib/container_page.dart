import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/favorite.dart';
import 'screens/mypage.dart';
import 'screens/webview_mobile.dart';
import 'screens/webview_windows.dart';

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
      label: '즐겨찾기',
      icon: Icon(Icons.favorite),
    ),
    const BottomNavigationBarItem(
      label: '내 페이지',
      icon: Icon(Icons.account_circle),
    ),
  ];

  List pages = [
    const HomeScreen(),
    null,
    const FavoriteScreen(),
    const MyPageScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    // final appbar = AppBar(title: const Text('Main Page'));

    switch (Platform.operatingSystem) {
      case "android":
      case "ios":
        pages[1] = const WebViewScreenMobile();
        break;
      case "windows":
        pages[1] = const WebViewScreenWindows();
        break;
      case "macos":
      case "linux":
      default:
        if (kIsWeb) {
          // running on the web
        } else {
          throw UnsupportedError('This platform is not supported.');
        }
    }

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

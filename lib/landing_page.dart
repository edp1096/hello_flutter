import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_flutter/container_page.dart';
import 'package:lottie/lottie.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Get.offAll(() => const ScreenContainer());
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    var splashImage = Image.asset(
      "assets/images/portrait.jpg",
      fit: BoxFit.cover,
    );

    if (width > height) {
      splashImage = Image.asset(
        "assets/images/dog_landscape.jpg",
        fit: BoxFit.cover,
      );
    }

    var scaffold = Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            color: Colors.amber,
            width: width,
            height: height,
            child: splashImage,
          ),
          // const CircularProgressIndicator(), // Loading circle
          Lottie.asset('assets/lottie/loading.json'), // Lottie
        ],
      ),
    );

    return scaffold;
  }
}

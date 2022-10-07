import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_flutter/main_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    var splashImage =
        Image.asset("assets/images/dog_portrait.jpg", fit: BoxFit.cover);

    if (width > height) {
      splashImage =
          Image.asset("assets/images/dog_landscape.jpg", fit: BoxFit.cover);
    } else {
      splashImage =
          Image.asset("assets/images/dog_portrait.jpg", fit: BoxFit.cover);
    }

    var body = Stack(
      alignment: Alignment.center,
      children: [
        Container(
          color: Colors.amber,
          width: width,
          height: height,
          child: splashImage,
        ),
        const CircularProgressIndicator(),
      ],
    );

    return Scaffold(body: body);
  }
}

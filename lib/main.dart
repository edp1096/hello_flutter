import 'package:flutter/material.dart';
import 'package:hello_flutter/landing_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const myapp = MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
      
    );

    return myapp;
  }
}

void main() {
  runApp(const MyApp());
}

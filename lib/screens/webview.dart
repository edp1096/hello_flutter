import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:hello_flutter/variables.dart';
import 'package:http/http.dart' as http;

Future<dynamic> checkHealth() async {
  final request = Uri.parse("http://127.0.0.1:2480/health");
  final response = await http.get(request);
  debugPrint(response.body);
}

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({Key? key}) : super(key: key);

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  @override
  Widget build(BuildContext context) {
    checkHealth();
    return Expanded(child: WebViewWidget(controller: controller));
  }
}

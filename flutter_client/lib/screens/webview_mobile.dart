import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:hello_flutter/variables.dart';
import 'package:http/http.dart' as http;

Future<dynamic> checkHealth() async {
  final request = Uri.parse("http://127.0.0.1:12480/health");
  final response = await http.get(request);
  debugPrint(response.body);
}

var controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..setBackgroundColor(const Color(0x00000000))
  ..setNavigationDelegate(
    NavigationDelegate(
      onProgress: (int progress) {},
      onPageStarted: (String url) {},
      onPageFinished: (String url) {},
      onWebResourceError: (WebResourceError error) {},
      onNavigationRequest: (NavigationRequest request) {
        if (request.url.startsWith('about:blank')) {
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      },
    ),
  )
  ..loadRequest(Uri.parse(webviewURI));

class WebViewScreenMobile extends StatefulWidget {
  const WebViewScreenMobile({super.key});

  @override
  State<WebViewScreenMobile> createState() => _WebViewScreenMobileState();
}

class _WebViewScreenMobileState extends State<WebViewScreenMobile> {
  @override
  Widget build(BuildContext context) {
    checkHealth();
    return Expanded(child: WebViewWidget(controller: controller));
  }
}

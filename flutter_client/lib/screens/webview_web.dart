import 'package:flutter/material.dart';
import 'dart:async';
import 'package:webview_flutter_web/webview_flutter_web.dart';
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';
import 'package:hello_flutter/variables.dart';
import 'package:http/http.dart' as http;

Future<dynamic> checkHealth() async {
  final request = Uri.parse("http://127.0.0.1:12480/health");
  final response = await http.get(request);
  debugPrint(response.body);
}

/* Dummy for prevent error */
class WebViewScreenWindows extends StatefulWidget {
  const WebViewScreenWindows({super.key});

  @override
  State<WebViewScreenWindows> createState() => _WebViewScreenWindowsState();
}

/* Dummy for prevent error */
class _WebViewScreenWindowsState extends State<WebViewScreenWindows> {
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

class WebViewScreenWeb extends StatefulWidget {
  const WebViewScreenWeb({super.key});

  @override
  State<WebViewScreenWeb> createState() => _WebViewScreenWebState();
}

class _WebViewScreenWebState extends State<WebViewScreenWeb> {
  final PlatformWebViewController _controller = PlatformWebViewController(
    const PlatformWebViewControllerCreationParams(),
  );

  @override
  void initState() {
    super.initState();
    WebViewPlatform.instance = WebWebViewPlatform();
  }

  @override
  Widget build(BuildContext context) {
    checkHealth();
    _controller.loadRequest(LoadRequestParams(uri: Uri.parse(webviewURI)));

    return Expanded(
      child: PlatformWebViewWidget(
        PlatformWebViewWidgetCreationParams(controller: _controller),
      ).build(context),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

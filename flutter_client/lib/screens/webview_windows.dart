import 'dart:ffi' as ffi;
import 'dart:io' show Platform, Directory;
import 'package:flutter/material.dart';
import 'package:webview_windows/webview_windows.dart';
import 'package:hello_flutter/variables.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

Future<dynamic> checkHealth() async {
  final request = Uri.parse("http://127.0.0.1:12480/health");
  final response = await http.get(request);
  debugPrint(response.body);
}

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({Key? key}) : super(key: key);

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  final _controller = WebviewController();
  bool _isWebViewCreated = false;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    final String libraryPath = path.join(
      Directory(Platform.resolvedExecutable).parent.path,
      'libserver.dll',
    );
    ffi.DynamicLibrary.open(libraryPath);

    await _controller.initialize();
    await _controller.setBackgroundColor(Colors.transparent);
    await _controller.setPopupWindowPolicy(WebviewPopupWindowPolicy.deny);
    await _controller.loadUrl(webviewURI);

    if (!mounted) {
      return;
    }
    setState(() {
      _isWebViewCreated = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    checkHealth();
    return Expanded(
      child: _isWebViewCreated
          ? Webview(_controller)
          : const Center(child: CircularProgressIndicator()),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

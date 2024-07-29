import 'dart:ffi' as ffi;
import 'dart:io' show Platform, Directory;
import 'package:flutter/material.dart';
import 'package:webview_windows/webview_windows.dart';
import 'package:hello_flutter/variables.dart';
// import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

/* Dummy for prevent error */
class WebViewScreenWeb extends StatefulWidget {
  const WebViewScreenWeb({super.key});

  @override
  State<WebViewScreenWeb> createState() => _WebViewScreenWebState();
}

/* Dummy for prevent error */
class _WebViewScreenWebState extends State<WebViewScreenWeb> {
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

class WebViewScreenWindows extends StatefulWidget {
  const WebViewScreenWindows({super.key});

  @override
  State<WebViewScreenWindows> createState() => _WebViewScreenWindowsState();
}

class _WebViewScreenWindowsState extends State<WebViewScreenWindows> {
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
    await _controller.loadUrl('$serverURI/hello');

    if (!mounted) {
      return;
    }
    setState(() {
      _isWebViewCreated = true;
    });
  }

  @override
  Widget build(BuildContext context) {
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

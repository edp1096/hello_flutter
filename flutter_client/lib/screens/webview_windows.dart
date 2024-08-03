import 'dart:ffi' as ffi;
import 'dart:io' show Platform, Directory;
import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_win_floating/webview_win_floating.dart';

import 'package:hello_flutter/variables.dart';
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
  final controller = WinWebViewController();

  @override
  void initState() {
    super.initState();

    final String libraryPath = path.join(
      Directory(Platform.resolvedExecutable).parent.path,
      'libserver.dll',
    );

    ffi.DynamicLibrary.open(libraryPath);

    controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    controller.setNavigationDelegate(WinNavigationDelegate(
      onNavigationRequest: (request) {
        if (request.url.startsWith("$serverURI/hello")) {
          return NavigationDecision.navigate;
        } else {
          debugPrint("prevent user navigate out of google website!");
          return NavigationDecision.prevent;
        }
      },
      onPageStarted: (url) => debugPrint("onPageStarted: $url"),
      onPageFinished: (url) => debugPrint("onPageFinished: $url"),
      onWebResourceError: (error) =>
          debugPrint("onWebResourceError: ${error.description}"),
    ));
    controller.loadRequest(Uri.parse("$serverURI/hello"));
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: WinWebViewWidget(controller: controller),
    );
  }
}

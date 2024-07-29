import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:hello_flutter/variables.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

Future<dynamic> _setInternalPath(uri) async {
  final response = await http.get(uri);
  debugPrint(response.body);
}

class WebViewScreenMobile extends StatefulWidget {
  const WebViewScreenMobile({super.key});

  @override
  State<WebViewScreenMobile> createState() => _WebViewScreenMobileState();
}

class _WebViewScreenMobileState extends State<WebViewScreenMobile> {
  late WebViewController controller;

  @override
  void initState() {
    super.initState();
    _initializeController();
  }

  Future<String> _getDocumentPath() async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<void> _initializeController() async {
    final pathURI = Uri.encodeComponent(await _getDocumentPath());
    final uriSetPath = Uri.parse('$serverURI/setpath?internalPath=$pathURI');
    _setInternalPath(uriSetPath);

    final uriWithPath = Uri.parse('$serverURI/hello?internalPath=$pathURI');
    controller = WebViewController()
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
      ..loadRequest(uriWithPath);
  }

  @override
  Widget build(BuildContext context) {
    final builder = FutureBuilder<void>(
      future: _initializeController(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return WebViewWidget(controller: controller);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );

    return Expanded(
      child: builder,
    );
  }
}

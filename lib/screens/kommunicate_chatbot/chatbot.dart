import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ChatBotKommunikate extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WebView(
        initialUrl: 'https://ayushsolanki-17.github.io/VAYU-Static/',
      ),
      );
  }
  
}
class WebViewApp extends StatefulWidget {
  const WebViewApp({super.key});

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  // Add from here ...
  @override
  void initState() {
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
    super.initState();
  }
  // ... to here.

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: const WebView(
        initialUrl: 'https://ayushsolanki-17.github.io/VAYU-Static/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

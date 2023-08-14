import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/pages/Home.dart';
import 'package:webview_flutter/webview_flutter.dart';
// Import for Android features.
// import 'package:webview_flutter_android/webview_flutter_android.dart';
// Import for iOS features.
// import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';



class CUonline extends StatefulWidget {
   
  @override
  State<CUonline> createState() => _CUonlineState();
}

class _CUonlineState extends State<CUonline> {
  WebViewController controller = WebViewController()
    // ..setJavaScriptMode(JavaScriptMode.unrestricted)
    // ..setNavigationDelegate(NavigationDelegate(
    //   onProgress: (int progress) {},
    //   onWebResourceError: (error) {

    //   },
    //   onNavigationRequest: (request) {
    //     if (request.url.startsWith('https://www.youtube.com/')) {
    //         return NavigationDecision.prevent;
    //       }
    //       return NavigationDecision.navigate;
    //   },
    // ))
    //     
    ..loadRequest(Uri.parse('https://cuonline.cuilahore.edu.pk:8091/'));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          backgroundColor: Color(0xff141d26),
          title: const Text(
            'CU online',
            style: TextStyle(
              fontSize: 22,
            ),
          ),
          centerTitle: true,
        ),
        body: WebViewWidget(controller: controller),
      ),
    );
  }
}

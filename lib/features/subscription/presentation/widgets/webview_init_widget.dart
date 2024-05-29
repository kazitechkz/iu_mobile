import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iu/core/app_constants/route_constant.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FreedomPayInitialScreen extends StatefulWidget {
  final String successUrl;
  final String failureUrl;
  final String url;
  const FreedomPayInitialScreen({super.key, required this.url, required this.successUrl, required this.failureUrl});

  @override
  State<FreedomPayInitialScreen> createState() => _WebViewInitialState();
}

class _WebViewInitialState extends State<FreedomPayInitialScreen> {
  late final WebViewController controller;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            if (url == widget.successUrl) {
              context.goNamed(RouteConstant.mySubscriptionsName);
            }
            if (url == widget.failureUrl) {
              context.goNamed(RouteConstant.subscriptionName);
            }
          },
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: WebViewWidget(controller: controller),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FreedomPay {
  static Future<String?> initPay(String url) async {
    final result = await FlutterWebAuth2.authenticate(
      url: url, callbackUrlScheme: 'paybox',
    );
    return null;
  }
}
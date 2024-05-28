import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';

class FreedomPay {
  static Future<String?> initPay(String url) async {
    final result = await FlutterWebAuth2.authenticate(
      url: url, callbackUrlScheme: 'paybox',
    );
    return null;
  }
}
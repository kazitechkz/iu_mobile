import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:iu/core/utils/http_utils.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../services/injection_main.container.dart';

class KundelikApi {
  static Future<String?> login() async {
    const url = 'https://login.kundelik.kz/oauth2?response_type=token&client_id=4111dfa786614bc29f01d27017a31a13&scope=CommonInfo,ContactInfo,EducationalInfo,FriendsAndRelatives&redirect_uri=iutest://callback';
    final result = await FlutterWebAuth2.authenticate(
      url: url, callbackUrlScheme: 'iutest',
    );
    final token = _extractToken(result);
    return token;
  }

  static String? _extractToken(String url) {
    final uri = Uri.parse(url);
    final fragment = uri.fragment;
    final token = Uri.splitQueryString(fragment)['access_token'];
    return token;
  }
}
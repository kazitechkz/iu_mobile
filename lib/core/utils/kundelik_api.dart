import 'package:iu/core/utils/http_utils.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../services/injection_main.container.dart';

class KundelikApi {
  static Future<void> login() async {
    final Uri toLaunch =
    Uri(
      scheme: 'https',
      host: 'login.kundelik.kz',
      path: 'oauth2',
      queryParameters: {"response_type": "token", "client_id": "4111dfa786614bc29f01d27017a31a13", "scope": "CommonInfo,ContactInfo,EducationalInfo,FriendsAndRelatives"}
    );

    if (await canLaunchUrl(toLaunch)) {
      await launchUrl(toLaunch, mode: LaunchMode.inAppBrowserView);
    } else {
      throw 'Could not launch $toLaunch';
    }
  }
}
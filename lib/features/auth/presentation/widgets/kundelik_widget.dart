import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iu/core/app_constants/route_constant.dart';
import 'package:iu/core/utils/hive_utils.dart';
import 'package:iu/core/widgets/common_app_bar_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class KundelikInitialScreen extends StatefulWidget {
  const KundelikInitialScreen({super.key});

  @override
  State<KundelikInitialScreen> createState() => _KundelikInitialScreenState();
}

class _KundelikInitialScreenState extends State<KundelikInitialScreen> {
  late final WebViewController controller;
  late WebViewCookieManager cookieManager = WebViewCookieManager();
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
            String cleanUrl = getCleanUrl(url);
            String? token = _extractToken(url);
            if (cleanUrl == 'https://iutest.kz/') {
              if (token != null) {
                HiveUtils().setString('kundelikToken', token);
                if (mounted) {
                  context.goNamed(RouteConstant.authScreenName);
                }
              }
            }
          },
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      );

    _clearCookiesAndCache();
  }

  Future<void> _clearCookiesAndCache() async {
    // Очистка кеша и локального хранилища
    await controller.clearCache();
    await controller.clearLocalStorage();

    // Очистка всех куков
    await cookieManager.clearCookies();

    // После очистки, загрузка URL
    if (mounted) {
      controller.loadRequest(Uri.parse('https://login.kundelik.kz/oauth2?response_type=token&client_id=4111dfa786614bc29f01d27017a31a13&scope=CommonInfo,ContactInfo,EducationalInfo,FriendsAndRelatives&redirect_uri=https://iutest.kz'));
    }
  }

  String getCleanUrl(String url) {
    Uri uri = Uri.parse(url);
    return '${uri.scheme}://${uri.host}${uri.path}';
  }

  String? _extractToken(String url) {
    final uri = Uri.parse(url);
    final fragment = uri.fragment;
    final token = Uri.splitQueryString(fragment)['access_token'];
    return token;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBarWidget(text: 'Күнделік', imageUrl: 'assets/images/kundelik_icon.png', routeLink: RouteConstant.authScreenName),
      body: WebViewWidget(controller: controller),
    );
  }
}

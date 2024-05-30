import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iu/core/app_constants/route_constant.dart';
import 'package:iu/core/utils/hive_utils.dart';
import 'package:iu/core/widgets/common_app_bar_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class KundelikInitialScreen extends StatefulWidget {
  const KundelikInitialScreen({super.key});

  @override
  State<KundelikInitialScreen> createState() => _KundelikInitialScreenState();
}

class _KundelikInitialScreenState extends State<KundelikInitialScreen> {
  late final WebViewController _controller;
  late WebViewCookieManager cookieManager = WebViewCookieManager();
  @override
  void initState() {
    super.initState();
    _initialController();
    _clearCookiesAndCache();
  }

  _initialController() {
    // #docregion platform_features
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller =
    WebViewController.fromPlatformCreationParams(params);
    // #enddocregion platform_features

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint('WebView is loading (progress : $progress%)');
          },
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            debugPrint('Page finished loading: $url');
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
          onWebResourceError: (WebResourceError error) {
            debugPrint('''
Page resource error:
  code: ${error.errorCode}
  description: ${error.description}
  errorType: ${error.errorType}
  isForMainFrame: ${error.isForMainFrame}
          ''');
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              debugPrint('blocking navigation to ${request.url}');
              return NavigationDecision.prevent;
            }
            debugPrint('allowing navigation to ${request.url}');
            return NavigationDecision.navigate;
          },
          onHttpError: (HttpResponseError error) {
            debugPrint('Error occurred on page: ${error.response?.statusCode}');
          },
          onUrlChange: (UrlChange change) {
            debugPrint('url change to ${change.url}');
            if (change.url != null) {
              print('not null ${change.url}');
              String cleanUrl = getCleanUrl(change.url!);
              String? token = _extractToken(change.url!);
              if (cleanUrl == 'https://iutest.kz/') {
                if (token != null) {
                  HiveUtils().setString('kundelikToken', token);
                  if (mounted) {
                    context.goNamed(RouteConstant.authScreenName);
                  }
                }
              }
            }

          },
          onHttpAuthRequest: (HttpAuthRequest request) {},
        ),
      )
      ..addJavaScriptChannel(
        'Toaster',
        onMessageReceived: (JavaScriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        },
      )
      ..loadRequest(Uri.parse('https://login.kundelik.kz/oauth2?response_type=token&client_id=4111dfa786614bc29f01d27017a31a13&scope=CommonInfo,ContactInfo,EducationalInfo,FriendsAndRelatives&redirect_uri=https://iutest.kz'));

    // #docregion platform_features
    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }
    // #enddocregion platform_features

    _controller = controller;
  }

  Future<void> _clearCookiesAndCache() async {
    // Очистка кеша и локального хранилища
    await _controller.clearCache();
    await _controller.clearLocalStorage();

    // Очистка всех куков
    await cookieManager.clearCookies();

    // После очистки, загрузка URL
    if (mounted) {
      _controller.loadRequest(Uri.parse('https://login.kundelik.kz/oauth2?response_type=token&client_id=4111dfa786614bc29f01d27017a31a13&scope=CommonInfo,ContactInfo,EducationalInfo,FriendsAndRelatives&redirect_uri=https://iutest.kz'));
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
      body: WebViewWidget(controller: _controller),
    );
  }
}

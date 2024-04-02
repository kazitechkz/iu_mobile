import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:iu/core/app_constants/font_constants.dart';
import 'core/interceptors/error_interceptor.dart';
import 'core/providers/user_provider.dart';
import 'core/services/injection_main.container.dart';
import 'core/services/router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  await slInit();
  runApp(MyApp(navigatorKey: navigatorKey));
}

class MyApp extends StatefulWidget {
  MyApp({required this.navigatorKey, super.key});
  GlobalKey<NavigatorState> navigatorKey;
  late RouteNavigation route;
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    widget.route = RouteNavigation(widget.navigatorKey);
    sl<Dio>()
        .interceptors
        .add(ServerErrorInterceptor(widget.route.appRouterConfig));
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserProvider(),
      child: ScreenUtilInit(
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          locale: const Locale("ru"),
          supportedLocales: const [
            Locale("ru"),
            Locale("kk"),
          ],
          title: 'EDU APP',
          theme: ThemeData(
            fontFamily: FontConstant.oswald,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            //fontFamily: MyFonts.SofiaSans,
            appBarTheme: const AppBarTheme(color: Colors.transparent),
            useMaterial3: true,
            //ColorScheme.fromSwatch(accentColor: MyColors.MAIN_VIOLET)),
          ),
          routerConfig: widget.route.appRouterConfig,
        ),
      ),
    );
  }
}

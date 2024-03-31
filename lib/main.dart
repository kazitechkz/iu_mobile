import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'core/services/injection_main.container.dart';
import 'core/services/router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await slInit();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
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
          fontFamily: 'Oswald',
          visualDensity: VisualDensity.adaptivePlatformDensity,
          //fontFamily: MyFonts.SofiaSans,
          appBarTheme: const AppBarTheme(color: Colors.transparent),
          useMaterial3: true,
          //ColorScheme.fromSwatch(accentColor: MyColors.MAIN_VIOLET)),
        ),
        routerConfig: appRouterConfig,
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({
//     Key? key,
//   }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       child: MaterialApp.router(
//         debugShowCheckedModeBanner: false,
//         localizationsDelegates: const [
//           AppLocalizations.delegate,
//           GlobalMaterialLocalizations.delegate,
//           GlobalWidgetsLocalizations.delegate,
//           GlobalCupertinoLocalizations.delegate,
//           GlobalMaterialLocalizations.delegate,
//         ],
//         locale: const Locale("ru"),
//         supportedLocales: const [
//           Locale("ru"),
//           Locale("kk"),
//         ],
//         title: 'EDU APP',
//         theme: ThemeData(
//           fontFamily: 'Oswald',
//           visualDensity: VisualDensity.adaptivePlatformDensity,
//           //fontFamily: MyFonts.SofiaSans,
//           appBarTheme: const AppBarTheme(color: Colors.transparent),
//           useMaterial3: true,
//           //ColorScheme.fromSwatch(accentColor: MyColors.MAIN_VIOLET)),
//         ),
//         routerConfig: appRouterConfig,
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

import 'core/services/injection_main.container.dart';
import 'core/services/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await slInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'EDU APP',
      theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          //fontFamily: MyFonts.SofiaSans,
          appBarTheme: const AppBarTheme(color: Colors.transparent),
          useMaterial3: true,
          //ColorScheme.fromSwatch(accentColor: MyColors.MAIN_VIOLET)),

    ),
      routerConfig: appRouterConfig,
    );
  }
}
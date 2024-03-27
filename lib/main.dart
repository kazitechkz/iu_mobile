import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return ScreenUtilInit(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
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
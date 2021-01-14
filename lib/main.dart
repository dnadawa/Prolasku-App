import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:prolasku/screens/login.dart';
import 'package:prolasku/screens/tab-page.dart';

void main() {
  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en', 'US'), Locale('fi', 'FI')],
        path: 'assets/translations',
        fallbackLocale: Locale('en', 'US'),
        child: MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(720, 1520),
      allowFontScaling: true,
      child: MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Color(0xfff5f5f5),
            accentColor: Color(0xff16A085),
            scaffoldBackgroundColor: Colors.white,
            fontFamily: 'Google Sans'
          ),
          home: TabPage()
      ),
    );
  }
}
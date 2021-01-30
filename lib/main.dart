import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:prolasku/screens/login.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {

  await DotEnv.load(fileName: '.env');
  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en', 'GB'), Locale('fi')],
        path: 'assets/translations',
        child: MyApp()
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  setDefaultLocation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String location = prefs.getString('location');
    if(location==null){
      prefs.setString('location', "Helsinki Warehouse");
      prefs.setString('locationID', '9');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setDefaultLocation();
  }

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
          home: Login()
      ),
    );
  }
}
import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:prolasku/screens/register.dart';
import 'package:prolasku/screens/tab-page.dart';
import 'package:prolasku/widgets/button.dart';
import 'package:prolasku/widgets/custom-text.dart';
import 'package:prolasku/widgets/input-field.dart';
import 'package:http/http.dart' as http;
import 'package:prolasku/widgets/toast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  ProgressDialog pr;
  List languages;
  List<Widget> flags = [];
  SharedPreferences prefs;

  logIn()async{
    if(email.text!=''&&password.text!=''){
      pr.show();
      var url = Constants.apiEndpoint+"get_customer/?"
          "username=${env['API_USERNAME']}&"
          "password=${env['API_PASSWORD']}&"
          "email=${email.text}&"
          "customer_password=${password.text}";

      var response = await http.post(
        url,
        headers: {
          'Authorization1': env['API_KEY'],
          'Content-Type': 'application/x-www-form-urlencoded'
        },
      );

      if(response.statusCode==200){
        var body = jsonDecode(response.body);
        String responseType = body['OUTPUT']['response_type'];
        String message = body['OUTPUT']['message'];
        pr.hide();
        print(body);
        if(responseType=='success'){
          String email = body['OUTPUT']['email'];
          String cid = body['OUTPUT']['customer_id'];
          String name = body['OUTPUT']['firstname'];
          String language = body['OUTPUT']['language'];

          Locale locale = Locale.fromSubtags(languageCode: language);
          String lStr = locale.toString();
          if(lStr.length==5){
            String language = lStr.substring(0,2);
            String country = lStr.substring(3,5);
            context.locale = Locale(language, country.toUpperCase());
          }
          else{
            context.locale = locale;
          }

          prefs.setString('email',email);
          prefs.setString('cid',cid);
          prefs.setString('name',name);
          prefs.setString('password', password.text);

          Navigator.of(context).pushAndRemoveUntil(
              CupertinoPageRoute(builder: (context) =>
                  TabPage()), (Route<dynamic> route) => false);


        }else{
          ToastBar(text: message, color: Colors.red).show();
        }

      }
      else{
        ToastBar(text: tr('somethingWrong'),color: Colors.red).show();
      }
    }else{
      ToastBar(text: tr('fillAllFields'),color: Colors.red).show();
    }

  }

  getLanguages()async{
    prefs = await SharedPreferences.getInstance();
    pr = ProgressDialog(context);
    pr = ProgressDialog(context,type: ProgressDialogType.Normal, isDismissible: false, showLogs: false);
    pr.style(
        message: tr('pleaseWait'),
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: Center(child: CircularProgressIndicator()),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        messageTextStyle: TextStyle(
            color: Colors.black, fontSize: ScreenUtil().setSp(35), fontWeight: FontWeight.bold)
    );
    var url = Constants.apiEndpoint+"get_languages/?"
        "username=${env['API_USERNAME']}&"
        "password=${env['API_PASSWORD']}";

    var response = await http.post(
      url,
      headers: {
        'Authorization1': env['API_KEY'],
        'Content-Type': 'application/x-www-form-urlencoded'
      },
    );

    if(response.statusCode==200){
      var body = jsonDecode(response.body);
      setState(() {
        languages = body['OUTPUT'];

        for(int i=0;i<languages.length;i++){
          flags.add(
              Padding(
                padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
                child: GestureDetector(
                  onTap: (){
                    Locale locale = Locale.fromSubtags(languageCode: languages[i]['code']);
                    String lStr = locale.toString();
                    if(lStr.length==5){
                      String language = lStr.substring(0,2);
                      String country = lStr.substring(3,5);
                      context.locale = Locale(language, country.toUpperCase());
                    }
                    else{
                      context.locale = locale;
                    }
                    },
                  child: Container(
                    child: Image.asset('icons/flags/png/${languages[i]['flag']!='zh.png'?languages[i]['flag']:'cn.png'}', package: 'country_icons'),
                    height: ScreenUtil().setHeight(30),
                    width: ScreenUtil().setWidth(40),
                  ),
                ),
              )
          );
        }

        
        
      });
      print(body);
    }
    else{
      print('error '+response.body);
    }
  }

  forgotPassword()async{
    if(email.text.isNotEmpty){
      pr.show();
      var url = Constants.apiEndpoint+"set_customer_password_reset_request/?"
          "username=${env['API_USERNAME']}&"
          "password=${env['API_PASSWORD']}&"
          "email=${email.text}";

      var response = await http.post(
        url,
        headers: {
          'Authorization1': env['API_KEY'],
          'Content-Type': 'application/x-www-form-urlencoded'
        },
      );
      print(response.body);
      if(response.statusCode==200){
        var body = jsonDecode(response.body);
        String status = body['OUTPUT']['response_type'];
        String message = body['OUTPUT']['message'];
        pr.hide();
        if(status=='success'){
          ToastBar(text: message,color: Colors.green).show();
        }else{
          ToastBar(text: message,color: Colors.red).show();
        }
      }else{
        pr.hide();
        ToastBar(text: tr('somethingWrong'),color: Colors.red).show();
      }
    }else{
      ToastBar(text: tr('fillEmail'),color: Colors.red).show();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLanguages();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(ScreenUtil().setHeight(30)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ///logo
                Padding(
                  padding: EdgeInsets.all(ScreenUtil().setHeight(50)),
                  child: SizedBox(
                      height: ScreenUtil().setHeight(200),
                      child: Image.asset('assets/images/logo.png')
                  ),
                ),

                ///title
                CustomText(text: tr('logIntoAccount'),size: ScreenUtil().setSp(50),font: 'ubuntu',),
                SizedBox(height: ScreenUtil().setHeight(100),),

                ///box
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(ScreenUtil().setHeight(50)),
                    child: Column(
                      children: [
                        ///email
                        InputField(hint: tr('email'),type: TextInputType.emailAddress,controller: email,),
                        SizedBox(height: ScreenUtil().setHeight(30),),

                        ///password
                        InputField(
                          hint: tr('password'),
                          controller: password,
                          isPassword: true,
                          suffix: GestureDetector(
                            onTap: ()=>forgotPassword(),
                            child: CustomText(
                              text: tr('forgot'),
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                        ),
                        SizedBox(height: ScreenUtil().setHeight(120),),

                        ///button
                        SizedBox(
                            width: double.infinity,
                            height: ScreenUtil().setHeight(100),
                            child: Button(text: tr('logIn'),onPressed: ()=>logIn()))
                      ],
                    ),
                  ),
                ),

                ///languages
                SizedBox(height: ScreenUtil().setHeight(30),),
                CustomText(text: tr('languages'),font: 'ubuntu',size: ScreenUtil().setSp(35),),
                SizedBox(height: ScreenUtil().setHeight(10),),
                Wrap(
                  alignment: WrapAlignment.center,
                  children: flags.isEmpty?[SizedBox(width: MediaQuery.of(context).size.width/2,child: LinearProgressIndicator(backgroundColor: Colors.white,))]:flags,
                ),


                ///signUp
                SizedBox(height: ScreenUtil().setHeight(80),),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          CupertinoPageRoute(builder: (context) => Register())
                      );
                    },
                    child: CustomText(
                      text: tr('dontHaveAccount'),
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}

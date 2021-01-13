import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prolasku/widgets/button.dart';
import 'package:prolasku/widgets/custom-text.dart';
import 'package:prolasku/widgets/input-field.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                        InputField(hint: tr('email'),),
                        SizedBox(height: ScreenUtil().setHeight(30),),

                        ///password
                        InputField(
                          hint: tr('password'),
                          isPassword: true,
                          suffix: GestureDetector(
                            onTap: (){print('forgot tapped');},
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
                            child: Button(text: tr('logIn'),onPressed: (){}))
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
                  children: [
                      Padding(
                        padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
                        child: GestureDetector(
                          onTap: (){},
                          child: Container(
                            color: Colors.red,
                            height: ScreenUtil().setHeight(60),
                            width: ScreenUtil().setWidth(80),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
                        child: GestureDetector(
                          onTap: (){},
                          child: Container(
                            color: Colors.red,
                            height: ScreenUtil().setHeight(60),
                            width: ScreenUtil().setWidth(80),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
                        child: GestureDetector(
                          onTap: (){},
                          child: Container(
                            color: Colors.red,
                            height: ScreenUtil().setHeight(60),
                            width: ScreenUtil().setWidth(80),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
                        child: GestureDetector(
                          onTap: (){},
                          child: Container(
                            color: Colors.red,
                            height: ScreenUtil().setHeight(60),
                            width: ScreenUtil().setWidth(80),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
                        child: GestureDetector(
                          onTap: (){},
                          child: Container(
                            color: Colors.red,
                            height: ScreenUtil().setHeight(60),
                            width: ScreenUtil().setWidth(80),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
                        child: GestureDetector(
                          onTap: (){},
                          child: Container(
                            color: Colors.red,
                            height: ScreenUtil().setHeight(60),
                            width: ScreenUtil().setWidth(80),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
                        child: GestureDetector(
                          onTap: (){},
                          child: Container(
                            color: Colors.red,
                            height: ScreenUtil().setHeight(60),
                            width: ScreenUtil().setWidth(80),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
                        child: GestureDetector(
                          onTap: (){},
                          child: Container(
                            color: Colors.red,
                            height: ScreenUtil().setHeight(60),
                            width: ScreenUtil().setWidth(80),
                          ),
                        ),
                      ),

                  ],
                ),


                ///signUp
                SizedBox(height: ScreenUtil().setHeight(80),),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: CustomText(
                    text: tr('dontHaveAccount'),
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

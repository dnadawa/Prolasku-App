import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prolasku/widgets/button.dart';
import 'package:prolasku/widgets/custom-text.dart';
import 'package:prolasku/widgets/input-field.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                CustomText(text: tr('createAccount'),size: ScreenUtil().setSp(50),font: 'ubuntu',),
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

                        ///profilePicture
                        CustomText(text: tr('uploadProfilePicture'),isBold: false,size: ScreenUtil().setSp(35),),
                        SizedBox(height: ScreenUtil().setHeight(30),),
                        CircleAvatar(
                          backgroundColor: Theme.of(context).accentColor,
                          radius: 40,
                          child: Icon(Icons.person,color: Colors.white,size: 50,),
                        ),

                        ///name
                        InputField(hint: tr('fullName'),),
                        SizedBox(height: ScreenUtil().setHeight(30),),

                        ///email
                        InputField(hint: tr('email'),),
                        SizedBox(height: ScreenUtil().setHeight(30),),

                        ///password
                        InputField(
                          hint: tr('password'),
                          isPassword: true,
                        ),
                        SizedBox(height: ScreenUtil().setHeight(30),),

                        ///phone
                        InputField(
                          hint: tr('phoneNo'),
                          //TODO: Add Prefix of phone no
                          prefix: Container(),
                        ),
                        SizedBox(height: ScreenUtil().setHeight(120),),

                        ///button
                        SizedBox(
                            width: double.infinity,
                            height: ScreenUtil().setHeight(100),
                            child: Button(text: tr('signUp'),onPressed: (){}))
                      ],
                    ),
                  ),
                ),


                ///signUp
                SizedBox(height: ScreenUtil().setHeight(80),),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomText(
                    text: tr('alreadyHaveAccount'),
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(30),),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

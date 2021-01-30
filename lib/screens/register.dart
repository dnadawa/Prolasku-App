import 'dart:convert';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prolasku/constants.dart';
import 'package:prolasku/widgets/button.dart';
import 'package:prolasku/widgets/custom-text.dart';
import 'package:prolasku/widgets/input-field.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  String prefix;

  signUp() async {
    var url = Constants.apiEndpoint+"set_customer_register/?"
        "username=${env['API_USERNAME']}&"
        "password=${env['API_PASSWORD']}&"
        "email=${email.text}&"
        "customer_password=${password.text}&"
        "phone_full=$prefix${phone.text}&"
        "phone_prefix=$prefix&"
        "phone=${phone.text}&"
        "language=en_gb";

    print(url);
    var response = await http.post(
      url,
      headers: {
      'Authorization1': env['API_KEY'],
      'Content-Type': 'application/json'
    },);
    print(response.body.toString());

    // print(url);
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
                        InputField(hint: tr('fullName'),controller: name,),
                        SizedBox(height: ScreenUtil().setHeight(30),),

                        ///email
                        InputField(hint: tr('email'),controller: email,type: TextInputType.emailAddress,),
                        SizedBox(height: ScreenUtil().setHeight(30),),

                        ///password
                        InputField(
                          hint: tr('password'),
                          isPassword: true,
                          controller: password,
                        ),
                        SizedBox(height: ScreenUtil().setHeight(30),),

                        ///phone
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: ScreenUtil().setHeight(60),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Colors.black,width: 2)
                                ),
                                child: CountryCodePicker(
                                  showDropDownButton: false,
                                  showFlagDialog: true,
                                  showFlag: false,
                                  showFlagMain: false,
                                  initialSelection: 'Suomi',
                                  textStyle: GoogleFonts.ubuntu(
                                    fontWeight: FontWeight.bold,
                                    fontSize: ScreenUtil().setSp(30)
                                  ),
                                  onInit: (code){prefix=code.dialCode.toString();},
                                  onChanged: (code){
                                    prefix=code.toString();
                                    },
                                ),
                              ),
                            ),
                            SizedBox(width: ScreenUtil().setWidth(20),),
                            Expanded(
                              flex: 4,
                              child: InputField(
                                hint: tr('phoneNo'),
                                controller: phone,
                                type: TextInputType.phone,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: ScreenUtil().setHeight(120),),

                        ///button
                        SizedBox(
                            width: double.infinity,
                            height: ScreenUtil().setHeight(100),
                            child: Button(text: tr('signUp'),onPressed: ()=>signUp()))
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

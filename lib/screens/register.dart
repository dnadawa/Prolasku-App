import 'dart:convert';
import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:devicelocale/devicelocale.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:prolasku/constants.dart';
import 'package:prolasku/widgets/button.dart';
import 'package:prolasku/widgets/custom-text.dart';
import 'package:prolasku/widgets/input-field.dart';
import 'package:http/http.dart' as http;
import 'package:prolasku/widgets/toast.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  String prefix, imageEncode;
  File image;
  ProgressDialog pr;

  signUp() async {
    String language = await Devicelocale.currentLocale;
    if(name.text!=''&&email.text!=''&&password.text!=''&&phone.text!=''&&imageEncode!=null){
      pr.show();
      var url = Constants.apiEndpoint+"set_customer_register/?"
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
        body: {
          'firstname': name.text,
          'phone_prefix': prefix,
          'phone': phone.text,
          'phone_full': prefix+phone.text,
          'image': imageEncode,
          'language': 'en_gb'
        }
      );
      if(response.statusCode==200){
        var body = jsonDecode(response.body);
        String responseType = body['OUTPUT']['response_type'];
        String message = body['OUTPUT']['message'];
        pr.hide();
        if(responseType=='success'){
          ToastBar(text: message,color: Colors.green).show();
          Navigator.pop(context);
        }else{
          ToastBar(text: message,color: Colors.red).show();
        }

      }
      else{
        print('error'+response.statusCode.toString());
        pr.hide();
        ToastBar(text: tr('emailSendingFailed'),color: Colors.red).show();
      }
    }
    else{
      ToastBar(text: tr('fillAllFields'),color: Colors.red).show();
    }

  }

  checkCustomerExists()async{
    pr = ProgressDialog(context);
    pr = ProgressDialog(context,type: ProgressDialogType.Normal, isDismissible: false, showLogs: false);
    pr.style(
        message: 'Please wait...',
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: Center(child: CircularProgressIndicator()),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        messageTextStyle: TextStyle(
            color: Colors.black, fontSize: ScreenUtil().setSp(35), fontWeight: FontWeight.bold)
    );
    pr.show();
    var url = Constants.apiEndpoint+"get_customer_exists/?"
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
      var isExists = body['OUTPUT']['TOTAL_COUNT'];
      pr.hide();
      if(isExists==0){
        signUp();
      }
      else{
        //forgot password
        showCupertinoDialog(
            context: context,
            builder: (BuildContext context){
                return CupertinoAlertDialog(
                  title: CustomText(text: 'Forgot password',),
                  content: CustomText(text: 'Would you like to send a new password to ${email.text}?',),
                  actions: <Widget>[
                    CupertinoDialogAction(
                      isDefaultAction: true,
                      child: CustomText(text: "Yes"),
                      onPressed: ()=>forgotPassword(),
                    ),
                    CupertinoDialogAction(
                      child: CustomText(text: "No"),
                      onPressed: (){
                        Navigator.pop(context);
                      },
                    )
                  ],
                );
            });
      }
    }
    else{
      ToastBar(text: tr('somethingWrong'),color: Colors.red).show();
    }
  }

  forgotPassword()async{
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
        Navigator.pop(context);
      }else{
        ToastBar(text: message,color: Colors.red).show();
      }
    }else{
      pr.hide();
      ToastBar(text: tr('somethingWrong'),color: Colors.red).show();
    }


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
                        GestureDetector(
                          onTap: ()async{
                            final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
                            setState(() {
                              if (pickedFile != null) {
                                image = File(pickedFile.path);
                                final bytes = image.readAsBytesSync();
                                imageEncode = base64.encode(bytes);
                              } else {
                                ToastBar(text: tr('imageNotSelected'),color: Colors.red).show();
                              }
                            });
                          },
                          child: CircleAvatar(
                            backgroundColor: Theme.of(context).accentColor,
                            radius: 40,
                            backgroundImage: image==null?null:FileImage(image),
                            child: image==null?Icon(Icons.person,color: Colors.white,size: 50,):Container(),
                          ),
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
                            child: Button(text: tr('signUp'),onPressed: ()=>checkCustomerExists()))
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

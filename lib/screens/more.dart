import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:prolasku/screens/more/newsletter.dart';
import 'package:prolasku/widgets/custom-text.dart';

class More extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
            height: ScreenUtil().setHeight(120),
            child: Image.asset('assets/images/logo.png')
        ),
      ),

      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [

          ///digital pdf newsletter
          Divider(height: 0,),
          ListTile(
           contentPadding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(60),0,ScreenUtil().setWidth(30),0),
            leading: Icon(CupertinoIcons.doc_text,color: Theme.of(context).accentColor,),
            title: CustomText(text: tr('digitalPDFNewsletter'),isBold: false,align: TextAlign.start,),
            trailing: Icon(Icons.chevron_right,color: Colors.black,),
            onTap: (){
              Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => DigitalPDFNewsletter())
              );
            },
          ),
          Divider(height: 0,),

          ///shop locations
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(60),0,ScreenUtil().setWidth(30),0),
            leading: SizedBox(
              width: ScreenUtil().setHeight(50),
              height: ScreenUtil().setHeight(50),
                child: Image.asset('assets/images/shop.png')
            ),
            title: CustomText(text: tr('shopLocations'),isBold: false,align: TextAlign.start,),
            trailing: Icon(Icons.chevron_right,color: Colors.black,),
            onTap: (){},
          ),
          Divider(height: 0,),

          ///profile
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(60),0,ScreenUtil().setWidth(30),0),
            leading: Icon(Icons.account_circle,color: Theme.of(context).accentColor),
            title: CustomText(text: tr('yourProfile'),isBold: false,align: TextAlign.start,),
            trailing: Icon(Icons.chevron_right,color: Colors.black,),
            onTap: (){},
          ),
          Divider(height: 0,),

          ///change language
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(60),0,ScreenUtil().setWidth(30),0),
            leading: Icon(CupertinoIcons.flag_circle,color: Theme.of(context).accentColor,),
            title: CustomText(text: tr('languageChange'),isBold: false,align: TextAlign.start,),
            trailing: Icon(Icons.chevron_right,color: Colors.black,),
            onTap: (){},
          ),
          Divider(height: 0,),

          ///app guide
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(60),0,ScreenUtil().setWidth(30),0),
            leading: Icon(CupertinoIcons.question_circle,color: Theme.of(context).accentColor,),
            title: CustomText(text: tr('appGuide'),isBold: false,align: TextAlign.start,),
            trailing: Icon(Icons.chevron_right,color: Colors.black,),
            onTap: (){},
          ),
          Divider(height: 0,),


          ///more info
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(60),0,ScreenUtil().setWidth(30),0),
            leading: Icon(CupertinoIcons.doc_text,color: Theme.of(context).accentColor,),
            title: CustomText(text: tr('moreInfo'),isBold: false,align: TextAlign.start,),
            trailing: Icon(Icons.chevron_right,color: Colors.black,),
            onTap: (){},
          ),
          Divider(height: 0,),

          ///privacy policy
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(60),0,ScreenUtil().setWidth(30),0),
            leading: Icon(CupertinoIcons.doc_text,color: Theme.of(context).accentColor,),
            title: CustomText(text: tr('privacyPolicy'),isBold: false,align: TextAlign.start,),
            trailing: Icon(Icons.chevron_right,color: Colors.black,),
            onTap: (){},
          ),
          Divider(height: 0,),

          ///data protection policy
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(60),0,ScreenUtil().setWidth(30),0),
            leading: Icon(CupertinoIcons.doc_text,color: Theme.of(context).accentColor,),
            title: CustomText(text: tr('dataProtectionPolicy'),isBold: false,align: TextAlign.start,),
            trailing: Icon(Icons.chevron_right,color: Colors.black,),
            onTap: (){},
          ),
          Divider(height: 0,),
        ],
      ),
    );
  }
}

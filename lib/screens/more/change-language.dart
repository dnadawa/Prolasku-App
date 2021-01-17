import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prolasku/widgets/custom-text.dart';
import 'package:prolasku/widgets/radio-list-item.dart';

class ChangeLanguage extends StatefulWidget {
  @override
  _ChangeLanguageState createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: tr('languageChange'),font: 'ubuntu',),
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(ScreenUtil().setWidth(20)),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            RadioListItem(
              title: 'English',
              leading: Icon(CupertinoIcons.flag_circle,color: Colors.white,size: 40,),
            ),
            RadioListItem(
              title: 'Finnish',
              leading: Icon(CupertinoIcons.flag_circle,color: Colors.white,size: 40,),
            ),
          ],
        ),
      ),
    );
  }
}

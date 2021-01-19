import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prolasku/screens/tab-page.dart';
import 'package:prolasku/widgets/button.dart';
import 'package:prolasku/widgets/custom-text.dart';

class OrderConfirm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding:  EdgeInsets.all(ScreenUtil().setHeight(120)),
              child: Image.asset('assets/images/confirm.png'),
            ),
            CustomText(text: tr('orderConfirmed'),font: 'ubuntu',size: ScreenUtil().setSp(50),),
            SizedBox(height: ScreenUtil().setHeight(50),),
            CustomText(text: tr('yourOrderNoIs'),size: ScreenUtil().setSp(35),),
            CustomText(text: '#123456789',size: ScreenUtil().setSp(70),color: Theme.of(context).accentColor,),
            SizedBox(height: ScreenUtil().setHeight(80),),
            Padding(
              padding: EdgeInsets.all(ScreenUtil().setHeight(30)),
              child: CustomText(text: tr('thankYouOrder'),size: ScreenUtil().setSp(30),isBold: false,),
            ),
            SizedBox(height: ScreenUtil().setHeight(80),),
            Padding(
              padding:  EdgeInsets.all(ScreenUtil().setWidth(50)),
              child: SizedBox(
                  width: double.infinity,
                  height: ScreenUtil().setHeight(100),
                  child: Button(text: tr('shopMore'),onPressed: (){
                    Navigator.push(
                        context,
                        CupertinoPageRoute(builder: (context) => TabPage())
                    );
                  })),
            )
          ],
        ),
      ),
    );
  }
}

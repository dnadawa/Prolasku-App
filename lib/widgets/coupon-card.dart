import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

import 'button.dart';
import 'custom-text.dart';

class CouponCard extends StatelessWidget {

  final String image;
  final String name;
  final int discount;

  const CouponCard({Key key, this.image, this.name, this.discount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Theme.of(context).accentColor,width: 3)
      ),
      elevation: 5,
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.all(ScreenUtil().setWidth(15)),
                    child: Center(child: Image.network(image)),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                        height: ScreenUtil().setHeight(150),
                        width: ScreenUtil().setHeight(150),
                        child: Stack(
                          children: [
                            Image.asset('assets/images/coupon.png'),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(left: ScreenUtil().setHeight(10)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomText(text: discount.toString()+"%",size: ScreenUtil().setSp(45),font: 'josefin',),
                                      CustomText(text: tr('discount'),size: ScreenUtil().setSp(25),font: 'josefin',),
                                    ],
                                  ),
                                ))
                          ],
                        )
                    ),
                  )
                ],
              )
          ),
          Padding(
            padding: EdgeInsets.all(ScreenUtil().setWidth(25)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: name,font: 'josefin',),
                SizedBox(
                  height: ScreenUtil().setHeight(50),
                  child: Button(
                    text: tr('activate'),
                    borderRadius: 5,
                    fontSize: 25,
                    onPressed: (){},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

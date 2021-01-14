import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prolasku/widgets/coupon-card.dart';
import 'package:prolasku/widgets/custom-text.dart';

class Coupons extends StatefulWidget {
  @override
  _CouponsState createState() => _CouponsState();
}

class _CouponsState extends State<Coupons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: CustomText(text: tr('coupons'),font: 'ubuntu',),
          elevation: 0,
          centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(ScreenUtil().setWidth(30)),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(20)),
              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height/4,
                child: CouponCard(
                  image: "https://e7.pngegg.com/pngimages/546/822/png-clipart-biscuit-wafer-weight-petit-beurre-biscuit-wafer-biscuits-thumbnail.png",
                  name: 'Biscuit Packet',
                  discount: 20,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(20)),
              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height/4,
                child: CouponCard(
                  image: "https://e7.pngegg.com/pngimages/546/822/png-clipart-biscuit-wafer-weight-petit-beurre-biscuit-wafer-biscuits-thumbnail.png",
                  name: 'Biscuit Packet',
                  discount: 20,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(20)),
              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height/4,
                child: CouponCard(
                  image: "https://e7.pngegg.com/pngimages/546/822/png-clipart-biscuit-wafer-weight-petit-beurre-biscuit-wafer-biscuits-thumbnail.png",
                  name: 'Biscuit Packet',
                  discount: 20,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(20)),
              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height/4,
                child: CouponCard(
                  image: "https://e7.pngegg.com/pngimages/546/822/png-clipart-biscuit-wafer-weight-petit-beurre-biscuit-wafer-biscuits-thumbnail.png",
                  name: 'Biscuit Packet',
                  discount: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prolasku/widgets/custom-text.dart';
import 'package:prolasku/widgets/radio-list-item.dart';

class ShopLocations extends StatefulWidget {
  @override
  _ShopLocationsState createState() => _ShopLocationsState();
}

class _ShopLocationsState extends State<ShopLocations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: tr('shopLocations'),font: 'ubuntu',),
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(ScreenUtil().setWidth(20)),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
              RadioListItem(
                leading: Padding(
                  padding: EdgeInsets.all(ScreenUtil().setWidth(25)),
                  child: Image.asset('assets/images/shopWhite.png'),
                ),
                title: 'Helsinki Shop',
              )
          ],
        ),
      ),
    );
  }
}
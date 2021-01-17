import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prolasku/widgets/custom-text.dart';

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
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5,
                color: Theme.of(context).primaryColor,
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.horizontal(left: Radius.circular(10)),
                        color: Theme.of(context).accentColor
                      ),
                      child: SizedBox(
                          width: ScreenUtil().setWidth(115),
                          height: ScreenUtil().setWidth(115),
                          child: Padding(
                            padding: EdgeInsets.all(ScreenUtil().setWidth(25)),
                            child: Image.asset('assets/images/shopWhite.png'),
                          )),
                    ),
                    Expanded(
                      child: RadioListTile(
                        title: CustomText(text: 'Helsinki Shop',isBold: false,),
                        value: 'a',
                        groupValue: 'asd',
                        onChanged: (s){},
                        controlAffinity: ListTileControlAffinity.trailing,
                        activeColor: Theme.of(context).accentColor,
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5,
                color: Theme.of(context).primaryColor,
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.horizontal(left: Radius.circular(10)),
                        color: Theme.of(context).accentColor
                      ),
                      child: SizedBox(
                          width: ScreenUtil().setWidth(115),
                          height: ScreenUtil().setWidth(115),
                          child: Padding(
                            padding: EdgeInsets.all(ScreenUtil().setWidth(25)),
                            child: Image.asset('assets/images/shopWhite.png'),
                          )),
                    ),
                    Expanded(
                      child: RadioListTile(
                        title: CustomText(text: 'Helsinki Shop',isBold: false,),
                        value: 'a',
                        groupValue: 'asd',
                        onChanged: (s){},
                        controlAffinity: ListTileControlAffinity.trailing,
                        activeColor: Theme.of(context).accentColor,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

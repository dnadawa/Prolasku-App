import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prolasku/widgets/custom-text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Stock extends StatefulWidget {
  @override
  _StockState createState() => _StockState();
}

class _StockState extends State<Stock> {

  SharedPreferences prefs;
  bool selected = false;
  getState()async{
    prefs = await SharedPreferences.getInstance();
    setState(() {
      selected = prefs.getBool('inStock')??false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getState();
  }


  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: selected,
      title: CustomText(text: tr('inStockItems'),size: ScreenUtil().setSp(35),),
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (val) {
        setState(() {
          selected = val;
          prefs.setBool('inStock', selected);
        });
      },
    );
  }
}

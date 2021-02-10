import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:money2/money2.dart';
import 'package:prolasku/constants.dart';
import 'package:prolasku/widgets/button.dart';
import 'package:prolasku/widgets/custom-text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Price extends StatefulWidget {
  @override
  _PriceState createState() => _PriceState();
}

class _PriceState extends State<Price> {
  RangeValues _currentRangeValues = RangeValues(Constants.minPrice, Constants.maxPrice);
  Currency euro = Currency.create('EUR', 0, symbol: '€', invertSeparators: true, pattern: '0S');
  SharedPreferences prefs;

  getState()async{
    prefs = await SharedPreferences.getInstance();
    double minPrice = prefs.getDouble('minPrice')??Constants.minPrice;
    double maxPrice = prefs.getDouble('maxPrice')??Constants.maxPrice;
    _currentRangeValues = RangeValues(minPrice, maxPrice);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(ScreenUtil().setHeight(30)),
          child: CustomText(text: '${Money.from(_currentRangeValues.start, euro)} - ${Money.from(_currentRangeValues.end, euro)}',size: ScreenUtil().setSp(40),),
        ),
        SizedBox(height: ScreenUtil().setHeight(30),),
        RangeSlider(
          values: _currentRangeValues,
          min: Constants.minPrice,
          max: Constants.maxPrice,
          divisions: Constants.maxPrice.toInt(),
          activeColor: Theme.of(context).accentColor,
          onChanged: (RangeValues values) {
            setState(() {
              _currentRangeValues = values;
              prefs.setDouble('minPrice', _currentRangeValues.start);
              prefs.setDouble('maxPrice', _currentRangeValues.end);
            });
          },
        ),
      ],
    );
  }
}

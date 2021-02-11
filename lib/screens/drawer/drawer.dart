import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:prolasku/constants.dart';
import 'package:prolasku/screens/drawer/categories.dart';
import 'package:prolasku/screens/drawer/price.dart';
import 'package:prolasku/screens/products.dart';
import 'package:prolasku/widgets/button.dart';
import 'package:prolasku/widgets/custom-text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Filter extends StatefulWidget {
  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: CustomText(text: tr('filter'),font: 'ubuntu',),
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: tr('price'),),
              Tab(text: tr('categories'),),
              Tab(text: tr('brands'),),
              Tab(text: tr('stock'),),
            ],
          ),
        ),

        body: Padding(
          padding:  EdgeInsets.all(ScreenUtil().setHeight(20)),
          child: Column(
            children: [
              Expanded(
                child: TabBarView(
                  children: [
                    Price(),
                    Categories(),
                    Categories(),
                    Categories(),
                  ],
                ),
              ),
              Button(
                text: tr('applyFilters'),
                borderRadius: 5,
                fontSize: 25,
                onPressed: () async {
                  String filter = '';
                  SharedPreferences prefs = await SharedPreferences.getInstance();

                  ///price
                  double min = prefs.getDouble('minPrice')??Constants.minPrice;
                  double max = prefs.getDouble('maxPrice')??Constants.maxPrice;
                  filter += "&min_price=$min&max_price=$max";


                  ///categories
                  List<String> selected = prefs.getStringList('categories')??[];
                  for(int i=0;i<selected.length;i++){
                    filter += "&cid[$i]=${selected[i]}";
                  }

                  print(filter);

                  Products.streamController.add(filter);
                  Navigator.pop(context);
                  },
              ),
              SizedBox(height: ScreenUtil().setHeight(30),)
            ],
          ),
        ),


      ),
    );
  }
}

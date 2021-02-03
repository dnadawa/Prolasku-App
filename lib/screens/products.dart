import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prolasku/screens/products/products-grid-view.dart';
import 'package:prolasku/screens/products/products-list-view.dart';
import 'package:prolasku/widgets/custom-text.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {

  bool isListView = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: tr('products'),font: 'ubuntu',),
        elevation: 0,
        centerTitle: true,
        actions: [

          ///list view
          Material(
            elevation: 5,
            shape: CircleBorder(),
            child: GestureDetector(
              onTap: (){
                setState(() {
                  isListView = true;
                });
              },
              child: CircleAvatar(
                radius: 18,
                backgroundColor: isListView?Theme.of(context).accentColor:Colors.white,
                child: Icon(Icons.list_alt_outlined,color: isListView?Colors.white:Theme.of(context).accentColor,size: 20,),
              ),
            ),
          ),

          ///grid view
          Padding(
            padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(15)),
            child: Material(
              elevation: 5,
              shape: CircleBorder(),
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    isListView = false;
                  });
                },
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: isListView?Colors.white:Theme.of(context).accentColor,
                  child: Icon(CupertinoIcons.rectangle_grid_2x2_fill,color: isListView?Theme.of(context).accentColor:Colors.white,size: 20,),
                ),
              ),
            ),
          ),

          ///filter
          Padding(
            padding: EdgeInsets.only(right: ScreenUtil().setWidth(10)),
            child: Material(
              elevation: 5,
              shape: CircleBorder(),
              child: GestureDetector(
                onTap: (){
                  print('clicked');
                  Scaffold.of(context).openEndDrawer();
                },
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.filter_list_alt,color: Theme.of(context).accentColor,size: 20,),
                ),
              ),
            ),
          )
        ],
      ),

      endDrawer: Drawer(
          child: DefaultTabController(
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
                child: ListView(
                  children: [
                    Row(
                      children: [
                        Checkbox(value: true, onChanged: (val){},),
                        CustomText(text: 'Rice Bags',align: TextAlign.start,),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(value: true, onChanged: (val){},),
                        CustomText(text: 'Rice Bags',align: TextAlign.start,),
                      ],
                    )
                  ],
                ),
              ),


            ),
          ),
      ),


      body: isListView?ProductsListView():ProductsGridView(),
    );
  }
}

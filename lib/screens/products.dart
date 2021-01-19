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
          Padding(
            padding: EdgeInsets.only(right: ScreenUtil().setWidth(10)),
            child: Material(
              elevation: 5,
              shape: CircleBorder(),
              child: CircleAvatar(
                radius: 18,
                backgroundColor: Colors.white,
                child: Icon(Icons.filter_list_alt,color: Theme.of(context).accentColor,size: 20,),
              ),
            ),
          )
        ],
      ),

      body: isListView?ProductsListView():ProductsGridView(),
    );
  }
}

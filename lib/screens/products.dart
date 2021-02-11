import 'dart:async';
import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prolasku/constants.dart';
import 'package:prolasku/screens/drawer/drawer.dart';
import 'package:prolasku/screens/products/products-grid-view.dart';
import 'package:prolasku/screens/products/products-list-view.dart';
import 'package:prolasku/widgets/custom-text.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Products extends StatefulWidget {
  static ScrollController scrollController = ScrollController();
  // ignore: close_sinks
  static StreamController streamController = StreamController.broadcast();
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {

  bool isListView = true;
  List products;
  int start = 0;
  String filter = '';
  int totalItemCount = 0;
  getProducts(int start) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String locationID = prefs.getString('locationID');
    String url = Constants.apiEndpoint+"get_products/?username=${env['API_USERNAME']}&password=${env['API_PASSWORD']}&start=${start*50}&limit=50&location_id=$locationID"+filter;
    print(url);
    var response = await http.post(
      url,
      headers: {
        'Authorization1': env['API_KEY'],
        'Content-Type': 'application/json'
      },
    );
    if(response.statusCode==200){
      var body = jsonDecode(response.body);
      setState(() {
        if(products==null){
          products = body['OUTPUT'];
        }else{
          products = products + body['OUTPUT'];
        }

        totalItemCount = body['INFO']['total_count'];
        print(products);

      });
    }
    else{
      print('error'+response.statusCode.toString());
      print(response.body);
    }
  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProducts(0);

    Stream stream = Products.streamController.stream;
    stream.asBroadcastStream().listen((value) {
      filter = value;
      setState(() {
        products = null;
      });
      getProducts(start);
    });

    Products.scrollController.addListener(() {
      if(Products.scrollController.position.pixels == Products.scrollController.position.maxScrollExtent){
        print('max scrolled');
        start++;
        getProducts(0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
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
                  _scaffoldKey.currentState.openEndDrawer();
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
          child: Filter(),
      ),


      body: isListView?ProductsListView(products: products,totalItemCount: totalItemCount,):ProductsGridView(products: products,totalItemCount: totalItemCount,),
    );
  }
}

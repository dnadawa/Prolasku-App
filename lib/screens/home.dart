import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money2/money2.dart';
import 'package:prolasku/main.dart';
import 'package:prolasku/screens/more/newsletter.dart';
import 'package:prolasku/screens/products.dart';
import 'package:prolasku/screens/products/product-details.dart';
import 'package:prolasku/screens/tab-page.dart';
import 'package:prolasku/widgets/coupon-card.dart';
import 'package:prolasku/widgets/custom-text.dart';
import 'package:prolasku/widgets/marquee.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../constants.dart';
import 'cart.dart';

class Home extends StatefulWidget {

  final TabController controller;

  const Home({Key key, this.controller}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List discountedItems;
  List latestProducts;
  SharedPreferences prefs;
  String location = 'n/a';
  String locationID;

  getDiscounts() async {
    String url = Constants.apiEndpoint+"get_discounted_items/?username=${env['API_USERNAME']}&password=${env['API_PASSWORD']}&start=0&limit=6";
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
        discountedItems = body['OUTPUT'];
      });
      print(body['OUTPUT'].length);
    }
    else{
      print('error'+response.statusCode.toString());
      print(response.body);
    }
  }
  getLatestProducts() async {
    await getLocation();
    String url = Constants.apiEndpoint+"get_products/?username=${env['API_USERNAME']}&password=${env['API_PASSWORD']}&start=0&limit=6&order=Desc&location_id=$locationID";
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
        latestProducts = body['OUTPUT'];
      });
    }
    else{
      print('error'+response.statusCode.toString());
      print(response.body);
    }
  }
  getLocation() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      location = prefs.getString('location');
      locationID = prefs.getString('locationID');
    });
  }


  getData()async{
    await getLatestProducts();
    getDiscounts();
  }

  @override
  void initState() {
    super.initState();
    getData();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Container(
            height: ScreenUtil().setHeight(120),
            child: Image.asset('assets/images/logo.png')
        ),

        actions: [
          CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor,
            child: IconButton(
              icon: Icon(CupertinoIcons.cart,color: Theme.of(context).accentColor,),
              onPressed: (){
                Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => Cart())
                );
              },),
          ),
          SizedBox(width: ScreenUtil().setWidth(20),),
          CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor,
            child: IconButton(
              icon: Icon(CupertinoIcons.bell,color: Theme.of(context).accentColor,),
              onPressed: (){},),
          ),
          SizedBox(width: ScreenUtil().setWidth(20),),
        ],
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){},
        label: CustomText(text: tr('loyaltyCard'),color: Colors.white,size: ScreenUtil().setSp(35),),
      ),

      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// welcome message
            Padding(
              padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(35),ScreenUtil().setWidth(20),ScreenUtil().setWidth(35),0),
              child: Text(
                tr("hello"),
                style: GoogleFonts.lobster(fontSize: ScreenUtil().setSp(80)),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(35)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                    CustomText(text: 'Sanjula Hasaranga',font: 'ubuntu',isBold: false,size: ScreenUtil().setSp(40),),
                    SizedBox(width: ScreenUtil().setWidth(30),),
                    Container(
                        width: ScreenUtil().setWidth(70),
                        height: ScreenUtil().setHeight(70),
                        child: Image.asset('assets/images/hand.png'))
                ],
              ),
            ),
            SizedBox(height: ScreenUtil().setWidth(40),),

           ///shop name
            Container(
              color: Theme.of(context).primaryColor,
              child: Padding(
                padding: EdgeInsets.all(ScreenUtil().setWidth(35)),
                child: Row(
                  children: [
                    Container(
                        height: ScreenUtil().setHeight(60),
                        width: ScreenUtil().setWidth(60),
                        child: Image.asset('assets/images/shop.png')
                    ),
                    SizedBox(width: ScreenUtil().setWidth(30),),
                    CustomText(text: location,size: ScreenUtil().setSp(30),)
                  ],
                ),
              ),
            ),
            SizedBox(height: ScreenUtil().setWidth(40),),


            ///latest products
            Padding(
              padding: EdgeInsets.all(ScreenUtil().setWidth(20)),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                color: Theme.of(context).primaryColor,
                elevation: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)
                            ),
                            border: Border.all(color: Theme.of(context).accentColor,width: 2)
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(ScreenUtil().setSp(15)),
                            child: CustomText(text: tr('latestProducts'),size: ScreenUtil().setSp(30),font: 'ubuntu',),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(25)),
                          child: GestureDetector(
                              onTap: (){
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(builder: (context) => Products())
                                );
                              },
                              child: CustomText(text: tr('seeMore'),isBold: false,color: Theme.of(context).accentColor,)),
                        )
                      ],
                    ),
                    SizedBox(height: ScreenUtil().setHeight(30),),
                    Padding(
                      padding: EdgeInsets.all(ScreenUtil().setHeight(30)),
                      child: latestProducts!=null?CarouselSlider.builder(
                        itemCount: latestProducts.length,
                        options: CarouselOptions(
                          viewportFraction: 0.5,
                          enableInfiniteScroll: false,
                          aspectRatio: 13/9
                        ),
                        itemBuilder: (context,i){

                          String image;
                          if(latestProducts[i]['images'].length>0){
                            image = latestProducts[i]['images'][0]['URL'];
                          }
                          else{
                            image = '';
                          }

                          // print(context.locale.toString().toLowerCase());
                          String name = latestProducts[i]['product_name']['en_gb'];

                          Currency euro = Currency.create('EUR', 2, symbol: '€', invertSeparators: true, pattern: 'S0,00');
                          Money price = Money.from(latestProducts[i]['price'], euro);

                          return GestureDetector(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(builder: (context) => ProductDetails())
                              );
                            },
                            child: SizedBox(
                              width: ScreenUtil().setWidth(400),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: BorderSide(color: Theme.of(context).accentColor,width: 3)
                                ),
                                elevation: 5,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.all(ScreenUtil().setWidth(15)),
                                          child: CachedNetworkImage(
                                            imageUrl: image,
                                            placeholder: (context,x)=>Icon(Icons.no_photography,size: 50,),
                                            errorWidget: (context,x,error)=>Icon(Icons.no_photography,size: 50,),
                                          ),
                                        )
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(15)),
                                      child: MarqueeWidget(child: CustomText(text: name,font: 'josefin',)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(ScreenUtil().setWidth(15)),
                                      child: CustomText(text: price.toString(),font: 'josefin',color: Theme.of(context).accentColor,),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ):Center(child: CircularProgressIndicator(),),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: ScreenUtil().setWidth(40),),


            ///coupons
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero
              ),
              color: Theme.of(context).primaryColor,
              elevation: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10)
                            ),
                            border: Border.all(color: Theme.of(context).accentColor,width: 2)
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(ScreenUtil().setSp(15)),
                          child: CustomText(text: tr('coupons'),size: ScreenUtil().setSp(30),font: 'ubuntu',),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(25)),
                        child: CustomText(text: tr('seeMore'),isBold: false,color: Theme.of(context).accentColor,),
                      )
                    ],
                  ),
                  SizedBox(height: ScreenUtil().setHeight(30),),
                  Padding(
                    padding: EdgeInsets.all(ScreenUtil().setHeight(30)),
                    child: CarouselSlider(
                      options: CarouselOptions(
                        enableInfiniteScroll: true,
                        enlargeCenterPage: true,
                        viewportFraction: 0.7,
                      ),
                      items: [
                        SizedBox(
                          //width: ScreenUtil().setWidth(650),
                          child: CouponCard(
                            image: "https://e7.pngegg.com/pngimages/546/822/png-clipart-biscuit-wafer-weight-petit-beurre-biscuit-wafer-biscuits-thumbnail.png",
                            name: 'Biscuit Packet',
                            discount: 20,
                          ),
                        ),

                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: ScreenUtil().setWidth(40),),


            ///discounts
            Padding(
              padding: EdgeInsets.all(ScreenUtil().setWidth(20)),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                ),
                color: Theme.of(context).primaryColor,
                elevation: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)
                              ),
                              border: Border.all(color: Theme.of(context).accentColor,width: 2)
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(ScreenUtil().setSp(15)),
                            child: CustomText(text: tr('discounts'),size: ScreenUtil().setSp(30),font: 'ubuntu',),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(25)),
                          child: CustomText(text: tr('seeMore'),isBold: false,color: Theme.of(context).accentColor,),
                        )
                      ],
                    ),
                    SizedBox(height: ScreenUtil().setHeight(30),),
                    Padding(
                      padding: EdgeInsets.all(ScreenUtil().setHeight(30)),
                      child: discountedItems!=null?CarouselSlider.builder(
                        itemCount: discountedItems.length,
                        options: CarouselOptions(
                          viewportFraction: 0.5,
                          aspectRatio: 13/9,
                          enableInfiniteScroll: false,
                          // height: ScreenUtil().setHeight(400)
                        ),
                        itemBuilder: (context,i){
                          String image;
                          if(discountedItems[i]['images'].length>0){
                            image = discountedItems[i]['images'][0]['URL'];
                          }
                          else{
                            image = 'https://www.orientalheritageagra.com/wp-content/uploads/2019/03/product-png-image-59158.png';
                          }

                          return GestureDetector(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(builder: (context) => ProductDetails())
                              );
                            },
                            child: SizedBox(
                              width: ScreenUtil().setWidth(400),
                              child: Card(
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
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(0,0,ScreenUtil().setWidth(10),ScreenUtil().setWidth(20)),
                                              child: Align(
                                                alignment: Alignment.bottomRight,
                                                child: Container(
                                                    height: ScreenUtil().setHeight(130),
                                                    width: ScreenUtil().setHeight(130),
                                                    child: Stack(
                                                      children: [
                                                        Image.asset('assets/images/discount.png'),
                                                        Align(
                                                            alignment: Alignment.bottomCenter,
                                                            child: Padding(
                                                              padding: EdgeInsets.only(top: ScreenUtil().setHeight(25)),
                                                              child: Column(
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                children: [
                                                                  CustomText(text: '99%',size: ScreenUtil().setSp(38),font: 'josefin',color: Colors.white,),
                                                                  CustomText(text: tr('discount'),size: ScreenUtil().setSp(20),font: 'josefin',color: Colors.white,),
                                                                ],
                                                              ),
                                                            ))
                                                      ],
                                                    )
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                    ),
                                    CustomText(text: 'name',font: 'josefin',),
                                    Padding(
                                      padding: EdgeInsets.all(ScreenUtil().setWidth(15)),
                                      child: RichText(
                                        text: TextSpan(
                                            text: '\$150.00 ',
                                            style: GoogleFonts.josefinSans(
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold,
                                                fontSize: ScreenUtil().setSp(30)
                                            ),
                                            children: [
                                              TextSpan(
                                                  text: '\$250.00',
                                                  style: GoogleFonts.josefinSans(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: ScreenUtil().setSp(20),
                                                      decoration: TextDecoration.lineThrough
                                                  )
                                              )
                                            ]
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ):Center(child: CircularProgressIndicator(),),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: ScreenUtil().setWidth(40),),


            ///digitalPDFNewsletter
            Padding(
              padding: EdgeInsets.all(ScreenUtil().setWidth(20)),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                ),
                color: Theme.of(context).primaryColor,
                elevation: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)
                              ),
                              border: Border.all(color: Theme.of(context).accentColor,width: 2)
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(ScreenUtil().setSp(15)),
                            child: CustomText(text: tr('digitalPDFNewsletter'),size: ScreenUtil().setSp(30),font: 'ubuntu',),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(25)),
                          child: GestureDetector(
                              onTap: (){
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(builder: (context) => DigitalPDFNewsletter())
                                );
                              },
                              child: CustomText(text: tr('seeMore'),isBold: false,color: Theme.of(context).accentColor,)),
                        )
                      ],
                    ),
                    SizedBox(height: ScreenUtil().setHeight(30),),
                    Padding(
                      padding: EdgeInsets.all(ScreenUtil().setHeight(30)),
                      child: CarouselSlider(
                        options: CarouselOptions(
                          viewportFraction: 0.5,
                          enableInfiniteScroll: true,
                          // height: ScreenUtil().setWidth(400),
                        ),
                        items: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(10)),
                            child: SizedBox(
                              width: ScreenUtil().setWidth(400),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                ),
                                elevation: 5,
                                color: Colors.white,
                                child: Image.network("https://venngage-wordpress.s3.amazonaws.com/uploads/2020/06/Real-Estate-Marketing-Tips-Email-Newsletter-Template.png",fit: BoxFit.fill,),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: ScreenUtil().setWidth(120),),

          ],
        ),
      ),

    );
  }
}

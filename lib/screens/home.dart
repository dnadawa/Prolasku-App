import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prolasku/widgets/button.dart';
import 'package:prolasku/widgets/coupon-card.dart';
import 'package:prolasku/widgets/custom-text.dart';
import 'package:prolasku/widgets/marquee.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
            height: ScreenUtil().setHeight(120),
            child: Image.asset('assets/images/logo.png')
        ),

        actions: [
          CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor,
            child: IconButton(
              icon: Icon(CupertinoIcons.cart,color: Theme.of(context).accentColor,),
              onPressed: (){},),
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
                    CustomText(text: "Sanjuwa's Shop",size: ScreenUtil().setSp(30),)
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
                          child: CustomText(text: tr('seeMore'),isBold: false,color: Theme.of(context).accentColor,),
                        )
                      ],
                    ),
                    SizedBox(height: ScreenUtil().setHeight(30),),
                    Padding(
                      padding: EdgeInsets.all(ScreenUtil().setHeight(30)),
                      child: CarouselSlider(
                        options: CarouselOptions(
                          viewportFraction: 0.5,
                          enableInfiniteScroll: false,
                          aspectRatio: 13/9
                        ),
                        items: [
                          SizedBox(
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
                                        child: Image.network("https://www.kindpng.com/picc/m/333-3334016_packet-biscuit-png-transparent-png.png"),
                                      )
                                  ),
                                  CustomText(text: 'Rice Bags',font: 'josefin',),
                                  Padding(
                                    padding: EdgeInsets.all(ScreenUtil().setWidth(15)),
                                    child: CustomText(text: '\$250.00',font: 'josefin',color: Theme.of(context).accentColor,),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
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
                                        child: Image.network("https://www.pngkey.com/png/full/72-724445_our-products-pasta-packet-in-india.png"),
                                      )
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(15)),
                                    child: MarqueeWidget(
                                        child: CustomText(text: 'Rice Bags of the namely co-ordinated under many curcumferences incods',font: 'josefin',)
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(ScreenUtil().setWidth(15)),
                                    child: CustomText(text: '\$250.00',font: 'josefin',color: Theme.of(context).accentColor,),
                                  ),
                                ],
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
                      child: CarouselSlider(
                        options: CarouselOptions(
                          viewportFraction: 0.5,
                          enableInfiniteScroll: true,
                          aspectRatio: 13/9
                          // height: ScreenUtil().setHeight(400)
                        ),
                        items: [
                          SizedBox(
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
                                            child: Center(child: Image.network("https://images.kglobalservices.com/www.leggomyeggo.com/en_us/product/product_4821901/kicproductimage-122854_00038000492747_c1l1.png")),
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
                                  CustomText(text: 'Rice Bags',font: 'josefin',),
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
                        ],
                      ),
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
                          child: CustomText(text: tr('seeMore'),isBold: false,color: Theme.of(context).accentColor,),
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

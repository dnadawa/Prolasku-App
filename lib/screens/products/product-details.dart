import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prolasku/widgets/button.dart';
import 'package:prolasku/widgets/custom-text.dart';
import 'package:prolasku/widgets/marquee.dart';
import 'package:http/http.dart' as http;
import '../../constants.dart';

class ProductDetails extends StatefulWidget {
  final String productID;
  final String name;
  final int discount;
  final List images;
  final List stockData;
  final String price;
  final String disPrice;
  final String vat;
  final String description;
  final int stockAlert;

  const ProductDetails({Key key, this.productID, this.name, this.discount, this.images, this.price, this.vat, this.description, this.stockData, this.stockAlert, this.disPrice}) : super(key: key);
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {



    Future<String> getLocations(String locationID) async {

      String url = Constants.apiEndpoint+"get_locations/?username=${env['API_USERNAME']}&password=${env['API_PASSWORD']}&location_id=$locationID";
      var response = await http.post(
        url,
        headers: {
          'Authorization1': env['API_KEY'],
          'Content-Type': 'application/json'
        },
      );
      if(response.statusCode==200){
        var body = jsonDecode(response.body);
        String location = body['OUTPUT'][0]["name"];
        return location;
      }
      else{
        print('error'+response.statusCode.toString());
        print(response.body);
        return 'Error';
      }
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MarqueeWidget(child: CustomText(text: widget.name,font: 'ubuntu',)),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            ///image
            Container(
              height: ScreenUtil().setHeight(400),
              child: Stack(
                children: [
                  CarouselSlider.builder(
                    options: CarouselOptions(
                      viewportFraction: 1,
                      enableInfiniteScroll: false
                    ),
                    itemCount: widget.images.length,
                    itemBuilder: (context,i){
                      String image = widget.images[i]["URL"];
                      print(image);
                      return Center(
                        child: CachedNetworkImage(
                          imageUrl: image,
                          placeholder: (context,x)=>Icon(Icons.no_photography,size: 50,),
                          errorWidget: (context,x,error)=>Icon(Icons.no_photography,size: 50,),
                        ),
                      );
                    },
                  ),
                  if(widget.discount!=0)
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                        height: ScreenUtil().setHeight(120),
                        width: ScreenUtil().setHeight(120),
                        child: Stack(
                          children: [
                            Image.asset('assets/images/coupon.png'),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(left: ScreenUtil().setHeight(10)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomText(text: widget.discount.toString()+"%",size: ScreenUtil().setSp(35),font: 'josefin',),
                                      CustomText(text: tr('discount'),size: ScreenUtil().setSp(20),font: 'josefin',),
                                    ],
                                  ),
                                ))
                          ],
                        )
                    ),
                  )
                ],
              ),
            ),

            ///price
            Padding(
              padding: EdgeInsets.all(ScreenUtil().setWidth(30)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomText(text: widget.price,font: 'josefin',size: ScreenUtil().setSp(60),color: Colors.red,),
                  SizedBox(width: ScreenUtil().setWidth(8),),
                  if(widget.discount!=0)
                  Text(widget.disPrice,style: GoogleFonts.josefinSans(
                      fontSize: ScreenUtil().setSp(35),
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.lineThrough,
                      fontStyle: FontStyle.italic
                  ),),
                  SizedBox(width: ScreenUtil().setWidth(8),),
                  CustomText(text: '(${tr('vat')} ${widget.vat}%)',size: ScreenUtil().setSp(25),isBold: false,),
                ],
              ),
            ),

            ///stocks
            Padding(
              padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(30)),
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: widget.stockData.length,
                itemBuilder: (context,i){

                  int stock = widget.stockData[i]['stock'];

                  return FutureBuilder(
                    future: getLocations(widget.stockData[i]['location_id'].toString()),
                    builder: (context,snapshot){
                      if(snapshot.hasData) {
                        return Padding(
                          padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: Colors.black, width: 2)
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(
                                  ScreenUtil().setWidth(15)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  ///dot
                                  CircleAvatar(
                                    backgroundColor:
                                    stock > widget.stockAlert ? Theme
                                        .of(context)
                                        .accentColor :
                                    stock <= widget.stockAlert && stock < 0
                                        ? Colors.orange
                                        :
                                    stock <= 0 ? Colors.red :
                                    stock <= widget.stockAlert && stock > 0
                                        ? Colors.orange
                                        :
                                    Colors.transparent,
                                    radius: 5,
                                  ),
                                  SizedBox(width: ScreenUtil().setWidth(20),),

                                  ///stock location
                                  SizedBox(
                                      width: ScreenUtil().setWidth(550),
                                      child: CustomText(text: '$stock ' +
                                          tr('availableInStock') + " :- " +
                                          snapshot.data,
                                        font: 'josefin',
                                        size: ScreenUtil().setSp(35),
                                        align: TextAlign.start,)),
                                ],
                              ),
                            ),
                          ),
                        );
                      }else{
                        return Center(child: LinearProgressIndicator(backgroundColor: Colors.white,),);
                      }
                    },
                  );

                },
              ),
            ),


            ///box
            Padding(
              padding: EdgeInsets.all(ScreenUtil().setWidth(30)),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).primaryColor
                ),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(ScreenUtil().setWidth(30)),
                      child: CustomText(text: widget.name,font: 'josefin',size: ScreenUtil().setSp(40),),
                    ),
                    Padding(
                      padding: EdgeInsets.all(ScreenUtil().setWidth(30)),
                      child: CustomText(
                        text: widget.description,
                        isBold: false,
                        size: ScreenUtil().setSp(28),
                        align: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              ),
            ),



            ///addToCart Button
            Center(
              child: Button(
                text: tr('addToCart'),
                fontSize: 30,
                borderRadius: 5,
                isCart: true,
                onPressed: (){},
              ),
            ),
            SizedBox(height: ScreenUtil().setHeight(80),)

          ],
        ),
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prolasku/screens/checkout.dart';
import 'package:prolasku/widgets/button.dart';
import 'package:prolasku/widgets/custom-text.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: tr('myCart'),font: 'ubuntu',),
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding:  EdgeInsets.all(ScreenUtil().setWidth(20)),
        child: Column(
          children: [
            ///listView
            Expanded(
              child: ListView(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Theme.of(context).primaryColor,
                    elevation: 5,
                    child: Padding(
                      padding: EdgeInsets.all(ScreenUtil().setWidth(30)),
                      child: Row(
                        children: [

                          ///remove
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.red,
                            child: Icon(Icons.remove,color: Colors.white,size: 20,),
                          ),
                          SizedBox(width: ScreenUtil().setWidth(20),),

                          ///image
                          Container(
                            width: ScreenUtil().setWidth(150),
                            height: ScreenUtil().setWidth(150),
                            child: Image.network('https://www.hi2world.com/pub/media/catalog/product/cache/c687aa7517cf01e65c009f6943c2b1e9/1/6/16165_1.jpg'),
                          ),
                          SizedBox(width: ScreenUtil().setWidth(20),),


                          ///name&price
                          Expanded(
                            child: Column(
                              children: [

                                ///name
                                CustomText(
                                  text: 'Here the name must be in full because products can have  long names which carry important details ',
                                  font: 'josefin',
                                  align: TextAlign.start,
                                ),
                                SizedBox(height: ScreenUtil().setHeight(20),),

                                ///prices
                                Row(
                                  children: [
                                    CustomText(text: '50,00\$',font: 'josefin',size: ScreenUtil().setSp(30),color: Colors.red,),
                                    SizedBox(width: ScreenUtil().setWidth(5),),
                                    Text('90,00\$',style: GoogleFonts.josefinSans(
                                        fontSize: ScreenUtil().setSp(20),
                                        color: Theme.of(context).accentColor,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.lineThrough,
                                        fontStyle: FontStyle.italic
                                    ),),
                                    SizedBox(width: ScreenUtil().setWidth(5),),
                                    CustomText(text: '(${tr('vat')} 14%)',size: ScreenUtil().setSp(20),isBold: false,),
                                  ],
                                )
                              ],
                            ),
                          ),


                          ///add remove
                          SizedBox(
                            height: ScreenUtil().setHeight(180),
                            width: ScreenUtil().setWidth(80),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)
                              ),
                              color: Color(0xffe5e5e5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                      onTap: (){print('add');},
                                      child: Icon(Icons.add,color: Colors.black,size: 20,)),
                                  Expanded(child: Container()),
                                  CustomText(text: '577\nKG',color: Theme.of(context).accentColor,font: 'josefin',),
                                  Expanded(child: Container()),
                                  GestureDetector(
                                      onTap: (){print('remove');},
                                      child: Icon(Icons.remove,color: Colors.black,size: 20,)),

                                ],
                              ),
                            ),
                          )


                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),


            ///total
            Padding(
              padding: EdgeInsets.all(ScreenUtil().setWidth(20)),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                color: Color(0xffa4a4a4),
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.all(ScreenUtil().setWidth(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(text: tr('total'),color: Colors.white,size: ScreenUtil().setSp(35),),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.horizontal(right: Radius.circular(5))
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(ScreenUtil().setWidth(20)),
                          child: CustomText(text: '11234\$',color: Theme.of(context).accentColor,size: ScreenUtil().setSp(35),),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),


            ///button
            Padding(
              padding:  EdgeInsets.all(ScreenUtil().setWidth(40)),
              child: SizedBox(
                width: double.infinity,
                height: ScreenUtil().setHeight(100),
                child: Button(
                  text: tr('checkout'),
                  onPressed: (){
                    Navigator.push(
                        context,
                        CupertinoPageRoute(builder: (context) => Checkout())
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

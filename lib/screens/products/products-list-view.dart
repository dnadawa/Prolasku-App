import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prolasku/widgets/button.dart';
import 'package:prolasku/widgets/custom-text.dart';
import 'package:prolasku/widgets/marquee.dart';

class ProductsListView extends StatefulWidget {
  @override
  _ProductsListViewState createState() => _ProductsListViewState();
}

class _ProductsListViewState extends State<ProductsListView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(ScreenUtil().setHeight(20)),
      child: ListView(
        children: [
          SizedBox(
            width: double.infinity,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
              ),
              elevation: 5,
              color: Theme.of(context).primaryColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: ScreenUtil().setHeight(250),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(ScreenUtil().setWidth(15)),
                          child: Center(child: Image.network('https://e7.pngegg.com/pngimages/546/822/png-clipart-biscuit-wafer-weight-petit-beurre-biscuit-wafer-biscuits-thumbnail.png')),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                              height: ScreenUtil().setHeight(150),
                              width: ScreenUtil().setHeight(150),
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
                                            CustomText(text: "20%",size: ScreenUtil().setSp(45),font: 'josefin',),
                                            CustomText(text: tr('discount'),size: ScreenUtil().setSp(25),font: 'josefin',),
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
                  Padding(
                    padding: EdgeInsets.all(ScreenUtil().setWidth(20)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomText(text: '50,00\$',font: 'josefin',size: ScreenUtil().setSp(40),color: Colors.red,),
                        SizedBox(width: ScreenUtil().setWidth(8),),
                        Text('90,00\$',style: GoogleFonts.josefinSans(
                          fontSize: ScreenUtil().setSp(25),
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.lineThrough,
                          fontStyle: FontStyle.italic
                        ),),
                        SizedBox(width: ScreenUtil().setWidth(8),),
                        CustomText(text: '(${tr('vat')} 14%)',size: ScreenUtil().setSp(20),isBold: false,),
                        Expanded(child: Container()),
                        Container(
                          width: 148,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.black, width: 2)
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(ScreenUtil().setWidth(8)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Theme.of(context).accentColor,
                                  radius: 5,
                                ),
                                CustomText(text: '24 '+tr('availableInStock'),font: 'josefin',),
                              ],
                            ),
                          ),
                        )

                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(15)),
                    child: MarqueeWidget(child: CustomText(text: 'Biscuit Packet',font: 'josefin',size: ScreenUtil().setSp(40),)),
                  ),
                  Padding(
                    padding:  EdgeInsets.all(ScreenUtil().setWidth(20)),
                    child: CustomText(text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quam leo, vestibulum vel nunc vel, viverra varius eros.s',size: ScreenUtil().setSp(25),align: TextAlign.start,),
                  ),
                  Center(
                    child: Button(
                      text: tr('addToCart'),
                      fontSize: 30,
                      borderRadius: 5,
                      isCart: true,
                      onPressed: (){},
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

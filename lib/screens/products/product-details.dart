import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prolasku/widgets/button.dart';
import 'package:prolasku/widgets/custom-text.dart';
import 'package:prolasku/widgets/marquee.dart';

class ProductDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: 'Biscuit Packet',font: 'ubuntu',),
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
                  Padding(
                    padding: EdgeInsets.all(ScreenUtil().setWidth(15)),
                    child: Center(child: Image.network('https://e7.pngegg.com/pngimages/546/822/png-clipart-biscuit-wafer-weight-petit-beurre-biscuit-wafer-biscuits-thumbnail.png')),
                  ),
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
                                      CustomText(text: "20%",size: ScreenUtil().setSp(35),font: 'josefin',),
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
                  CustomText(text: '50,00\$',font: 'josefin',size: ScreenUtil().setSp(60),color: Colors.red,),
                  SizedBox(width: ScreenUtil().setWidth(8),),
                  Text('90,00\$',style: GoogleFonts.josefinSans(
                      fontSize: ScreenUtil().setSp(35),
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.lineThrough,
                      fontStyle: FontStyle.italic
                  ),),
                  SizedBox(width: ScreenUtil().setWidth(8),),
                  CustomText(text: '(${tr('vat')} 14%)',size: ScreenUtil().setSp(25),isBold: false,),
                ],
              ),
            ),

            ///stocks
            Padding(
              padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(30)),
              child: ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Padding(
                    padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.black, width: 2)
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(ScreenUtil().setWidth(15)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ///dot
                            CircleAvatar(
                              backgroundColor: Theme.of(context).accentColor,
                              radius: 5,
                            ),
                            SizedBox(width: ScreenUtil().setWidth(20),),
                            ///stock location
                            SizedBox(
                                width: ScreenUtil().setWidth(550),
                                child: CustomText(text: '24 '+tr('availableInStock')+" :- Helsinki",font: 'josefin',size: ScreenUtil().setSp(35),align: TextAlign.start,)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.black, width: 2)
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(ScreenUtil().setWidth(15)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ///dot
                            CircleAvatar(
                              backgroundColor: Theme.of(context).accentColor,
                              radius: 5,
                            ),
                            SizedBox(width: ScreenUtil().setWidth(20),),
                            ///stock location
                            SizedBox(
                                width: ScreenUtil().setWidth(550),
                                child: CustomText(text: '24 '+tr('availableInStock')+" :- Helsinki",font: 'josefin',size: ScreenUtil().setSp(35),align: TextAlign.start,)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.black, width: 2)
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(ScreenUtil().setWidth(15)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ///dot
                            CircleAvatar(
                              backgroundColor: Theme.of(context).accentColor,
                              radius: 5,
                            ),
                            SizedBox(width: ScreenUtil().setWidth(20),),
                            ///stock location
                            SizedBox(
                                width: ScreenUtil().setWidth(550),
                                child: CustomText(text: '24 '+tr('availableInStock')+" :- Helsinki",font: 'josefin',size: ScreenUtil().setSp(35),align: TextAlign.start,)),
                          ],
                        ),
                      ),
                    ),
                  ),

                ],
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
                      child: CustomText(text: 'Biscuit Packet',font: 'josefin',size: ScreenUtil().setSp(40),),
                    ),
                    Padding(
                      padding: EdgeInsets.all(ScreenUtil().setWidth(30)),
                      child: CustomText(
                        text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In eget libero ac libero porttitor rutrum. Etiam a nisl elit. Duis blandit sem eu justo pretium, eu commodo nisl lacinia. Aliquam viverra risus non laoreet blandit. Maecenas lacus purus, eleifend sit amet metus eu, euismod auctor turpis. Aenean sodales nunc odio, a pharetra eros congue a. Vivamus tincidunt pellentesque elit, at maximus enim feugiat ac. Fusce suscipit, nibh et vulputate efficitur, tortor arcu malesuada nisl, in molestie leo elit eu massa. Sed tempor nibh a sapien blandit sollicitudin.",
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

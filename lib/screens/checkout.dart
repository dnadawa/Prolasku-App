import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prolasku/screens/order-confirmation.dart';
import 'package:prolasku/widgets/button.dart';
import 'package:prolasku/widgets/custom-text.dart';
import 'package:prolasku/widgets/input-field.dart';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> with SingleTickerProviderStateMixin{

  bool isDifferentShippingAddress = false;
  double _height = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: tr('checkout'),font: 'ubuntu',),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            ///title - billing/shipping address
            SizedBox(height: ScreenUtil().setHeight(40),),
            Container(
              height: ScreenUtil().setHeight(70),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(10)
                ),
                color: Theme.of(context).accentColor,
              ),
              child: Padding(
                padding: EdgeInsets.all(ScreenUtil().setWidth(15)),
                child: CustomText(
                  text: tr('billingShippingAddress'),
                  color: Colors.white,
                  size: ScreenUtil().setSp(35),
                ),
              ),
            ),

            ///addLine1
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(40)),
              child: InputField(hint: tr('addressLine1'),),
            ),
            SizedBox(height: ScreenUtil().setHeight(30),),

            ///addLine2
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(40)),
              child: InputField(hint: tr('addressLine2'),),
            ),
            SizedBox(height: ScreenUtil().setHeight(30),),

            ///postal
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(40)),
              child: InputField(hint: tr('postal'),),
            ),
            SizedBox(height: ScreenUtil().setHeight(30),),

            ///state
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(40)),
              child: InputField(hint: tr('state'),),
            ),
            SizedBox(height: ScreenUtil().setHeight(30),),

            ///cityID
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(40)),
              child: Align(
                  alignment: Alignment.bottomLeft,
                  child: CustomText(text: tr('cityID'),font: 'ubuntu',align: TextAlign.start,size: ScreenUtil().setSp(32),)),
            ),
            SizedBox(height: ScreenUtil().setHeight(25),),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(40)),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    border: Border.all(color: Colors.black,width: 2)
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setHeight(10)),
                  child: DropdownButton(
                    isExpanded: true,
                    underline: Container(),
                    items: [
                      DropdownMenuItem(
                        child: Center(child: CustomText(text: 'Helsinki',font: 'ubuntu',)),
                      )
                    ],
                    onChanged: (val){},
                  ),
                ),
              ),
            ),
            SizedBox(height: ScreenUtil().setHeight(30),),


            ///ship to a different address
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(40)),
              child: Align(
                  alignment: Alignment.bottomLeft,
                  child: CustomText(text: tr('shipToADifferentAddress'),align: TextAlign.start,size: ScreenUtil().setSp(32),)),
            ),
            SizedBox(height: ScreenUtil().setHeight(30),),



            ///checkBox
            Container(
              height: ScreenUtil().setHeight(70),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(10)
                ),
                color: Theme.of(context).accentColor,
              ),
              child: Padding(
                padding: EdgeInsets.all(ScreenUtil().setWidth(15)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox(
                        value: isDifferentShippingAddress,
                        checkColor: Theme.of(context).accentColor,
                        activeColor: Colors.white,
                        onChanged: (val){
                          setState(() {
                            isDifferentShippingAddress = val;
                            if(isDifferentShippingAddress){
                              _height = null;
                            }
                            else{
                              _height = 0;
                            }
                          });
                        }
                    ),
                    CustomText(
                      text: tr('differentShippingAddress'),
                      color: Colors.white,
                      size: ScreenUtil().setSp(35),
                    ),
                  ],
                ),
              ),
            ),


            AnimatedSize(
              vsync: this,
              duration: Duration(milliseconds: 750),
              curve: Curves.fastOutSlowIn,
              child: Container(
                height: _height,
                child: Column(
                  children: [
                    ///shippingAddressLine1
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(40)),
                      child: InputField(hint: tr('shippingAddressLine1'),),
                    ),
                    SizedBox(height: ScreenUtil().setHeight(30),),

                    ///shippingAddressLine2
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(40)),
                      child: InputField(hint: tr('shippingAddressLine2'),),
                    ),
                    SizedBox(height: ScreenUtil().setHeight(30),),

                    ///shippingPostal
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(40)),
                      child: InputField(hint: tr('shippingPostal'),),
                    ),
                    SizedBox(height: ScreenUtil().setHeight(30),),

                    ///shippingState
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(40)),
                      child: InputField(hint: tr('shippingState'),),
                    ),
                    SizedBox(height: ScreenUtil().setHeight(30),),


                    ///shippingCityID
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(40)),
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: CustomText(text: tr('shippingCityID'),font: 'ubuntu',align: TextAlign.start,size: ScreenUtil().setSp(32),)),
                    ),
                    SizedBox(height: ScreenUtil().setHeight(25),),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(40)),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                            border: Border.all(color: Colors.black,width: 2)
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setHeight(10)),
                          child: DropdownButton(
                            isExpanded: true,
                            underline: Container(),
                            items: [
                              DropdownMenuItem(
                                child: Center(child: CustomText(text: 'Helsinki',font: 'ubuntu',)),
                              )
                            ],
                            onChanged: (val){},
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: ScreenUtil().setHeight(120),),



            Padding(
              padding:  EdgeInsets.all(ScreenUtil().setWidth(50)),
              child: SizedBox(
                  width: double.infinity,
                  height: ScreenUtil().setHeight(100),
                  child: Button(text: tr('placeTheOrder'),onPressed: (){
                    Navigator.push(
                        context,
                        CupertinoPageRoute(builder: (context) => OrderConfirm())
                    );
                  })),
            )



          ],
        ),
      ),
    );
  }
}

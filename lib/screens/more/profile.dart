import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prolasku/widgets/button.dart';
import 'package:prolasku/widgets/custom-text.dart';
import 'package:prolasku/widgets/input-field.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(ScreenUtil().setHeight(30)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ///logo
                Padding(
                  padding: EdgeInsets.all(ScreenUtil().setHeight(50)),
                  child: SizedBox(
                      height: ScreenUtil().setHeight(200),
                      child: Image.asset('assets/images/logo.png')
                  ),
                ),

                ///title
                CustomText(text: tr('yourProfile'),size: ScreenUtil().setSp(50),font: 'ubuntu',),
                SizedBox(height: ScreenUtil().setHeight(100),),

                ///box
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(ScreenUtil().setHeight(50)),
                    child: Column(
                      children: [

                        ///profilePicture
                        CustomText(text: tr('uploadProfilePicture'),isBold: false,size: ScreenUtil().setSp(35),),
                        SizedBox(height: ScreenUtil().setHeight(30),),
                        CircleAvatar(
                          backgroundColor: Theme.of(context).accentColor,
                          radius: 40,
                          child: Icon(Icons.person,color: Colors.white,size: 50,),
                        ),

                        ///name
                        InputField(hint: tr('fullName'),),
                        SizedBox(height: ScreenUtil().setHeight(30),),

                        ///email
                        InputField(hint: tr('email'),),
                        SizedBox(height: ScreenUtil().setHeight(30),),


                        ///phone
                        InputField(
                          hint: tr('phoneNo'),
                          //TODO: Add Prefix of phone no
                          prefix: Container(),
                        ),
                        SizedBox(height: ScreenUtil().setHeight(30),),


                        ///language
                        Align(
                            alignment: Alignment.bottomLeft,
                            child: CustomText(text: tr('language'),font: 'ubuntu',align: TextAlign.start,size: ScreenUtil().setSp(32),)),
                        SizedBox(height: ScreenUtil().setHeight(25),),
                        Container(
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
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(width: ScreenUtil().setWidth(20),),
                                    Container(
                                        color: Colors.red,
                                        height: ScreenUtil().setHeight(37.5),
                                        width: ScreenUtil().setWidth(50),
                                      ),
                                    Expanded(child: CustomText(text: 'English',font: 'ubuntu',))
                                    ],
                                  ),
                                )
                              ],
                              onChanged: (val){},
                            ),
                          ),
                        ),
                        SizedBox(height: ScreenUtil().setHeight(30),),


                        ///tradeName
                        InputField(hint: tr('tradeName'),),
                        SizedBox(height: ScreenUtil().setHeight(30),),

                        ///business
                        InputField(hint: tr('business'),),
                        SizedBox(height: ScreenUtil().setHeight(30),),

                        ///businessID
                        InputField(hint: tr('businessID'),),
                        SizedBox(height: ScreenUtil().setHeight(30),),

                        ///addLine1
                        InputField(hint: tr('addressLine1'),),
                        SizedBox(height: ScreenUtil().setHeight(30),),

                        ///addLine2
                        InputField(hint: tr('addressLine2'),),
                        SizedBox(height: ScreenUtil().setHeight(30),),

                        ///postal
                        InputField(hint: tr('postal'),),
                        SizedBox(height: ScreenUtil().setHeight(30),),

                        ///state
                        InputField(hint: tr('state'),),
                        SizedBox(height: ScreenUtil().setHeight(30),),

                        ///cityID
                        Align(
                            alignment: Alignment.bottomLeft,
                            child: CustomText(text: tr('cityID'),font: 'ubuntu',align: TextAlign.start,size: ScreenUtil().setSp(32),)),
                        SizedBox(height: ScreenUtil().setHeight(25),),
                        Container(
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
                        SizedBox(height: ScreenUtil().setHeight(30),),


                        ///countryID
                        Align(
                            alignment: Alignment.bottomLeft,
                            child: CustomText(text: tr('countryID'),font: 'ubuntu',align: TextAlign.start,size: ScreenUtil().setSp(32),)),
                        SizedBox(height: ScreenUtil().setHeight(25),),
                        Container(
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
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(width: ScreenUtil().setWidth(20),),
                                      Container(
                                        color: Colors.red,
                                        height: ScreenUtil().setHeight(37.5),
                                        width: ScreenUtil().setWidth(50),
                                      ),
                                      Expanded(child: CustomText(text: 'English',font: 'ubuntu',))
                                    ],
                                  ),
                                )
                              ],
                              onChanged: (val){},
                            ),
                          ),
                        ),
                        SizedBox(height: ScreenUtil().setHeight(30),),


                        ///shippingAddressDifferent
                        Align(
                            alignment: Alignment.bottomLeft,
                            child: CustomText(text: tr('shippingAddressDifferent'),font: 'ubuntu',align: TextAlign.start,size: ScreenUtil().setSp(32),)),
                        SizedBox(height: ScreenUtil().setHeight(25),),
                        Row(
                          children: [
                             Expanded(
                               child: RadioListTile(
                                   value: 'x',
                                   groupValue: 'sh',
                                   onChanged: (val){},
                                   title: CustomText(text: tr('yes'),align: TextAlign.end,),
                                   controlAffinity: ListTileControlAffinity.trailing,
                                   activeColor: Theme.of(context).accentColor,
                               ),
                             ),
                            Expanded(
                              child: RadioListTile(
                                value: 'y',
                                groupValue: 'sh',
                                onChanged: (val){},
                                title: CustomText(text: tr('no'),align: TextAlign.end,),
                                controlAffinity: ListTileControlAffinity.trailing,
                                activeColor: Theme.of(context).accentColor,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: ScreenUtil().setHeight(30),),


                        ///shippingAddressLine1
                        InputField(hint: tr('shippingAddressLine1'),),
                        SizedBox(height: ScreenUtil().setHeight(30),),

                        ///shippingAddressLine2
                        InputField(hint: tr('shippingAddressLine2'),),
                        SizedBox(height: ScreenUtil().setHeight(30),),


                        ///shippingCityID
                        Align(
                            alignment: Alignment.bottomLeft,
                            child: CustomText(text: tr('shippingCityID'),font: 'ubuntu',align: TextAlign.start,size: ScreenUtil().setSp(32),)),
                        SizedBox(height: ScreenUtil().setHeight(25),),
                        Container(
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
                        SizedBox(height: ScreenUtil().setHeight(30),),


                        ///shippingPostal
                        InputField(hint: tr('shippingPostal'),),
                        SizedBox(height: ScreenUtil().setHeight(30),),

                        ///shippingState
                        InputField(hint: tr('shippingState'),),
                        SizedBox(height: ScreenUtil().setHeight(30),),


                        ///orderingEmail
                        InputField(hint: tr('orderingEmail'),),
                        SizedBox(height: ScreenUtil().setHeight(30),),

                        ///billingEmail
                        InputField(hint: tr('billingEmail'),),
                        SizedBox(height: ScreenUtil().setHeight(30),),

                        ///website
                        InputField(hint: tr('website'),),
                        SizedBox(height: ScreenUtil().setHeight(30),),


                        ///newsletter
                        Align(
                          alignment: Alignment.centerLeft,
                          child: CheckboxListTile(
                              value: true,
                              onChanged: (val){},
                              activeColor: Theme.of(context).accentColor,
                            title: CustomText(text: tr('signUpForNewsletter'),font: 'ubuntu',),


                          ),
                        ),
                        SizedBox(height: ScreenUtil().setHeight(80),),

                        ///button
                        SizedBox(
                            width: double.infinity,
                            height: ScreenUtil().setHeight(100),
                            child: Button(text: tr('update'),onPressed: (){}))
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

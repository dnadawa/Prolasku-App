import 'dart:convert';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prolasku/widgets/button.dart';
import 'package:prolasku/widgets/custom-text.dart';
import 'package:prolasku/widgets/input-field.dart';
import 'package:http/http.dart' as http;
import 'package:prolasku/widgets/toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController tradeName = TextEditingController();
  TextEditingController business = TextEditingController();
  TextEditingController businessID = TextEditingController();
  TextEditingController ad1 = TextEditingController();
  TextEditingController ad2 = TextEditingController();
  TextEditingController postal = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController sAd1 = TextEditingController();
  TextEditingController sAd2 = TextEditingController();
  TextEditingController sPostal = TextEditingController();
  TextEditingController sState = TextEditingController();
  TextEditingController orderingEmail = TextEditingController();
  TextEditingController billingEmail = TextEditingController();
  TextEditingController website = TextEditingController();
  bool newsletter = true;
  String shipping = 'no';
  List<DropdownMenuItem> citiesDropDownItems = [];
  List<DropdownMenuItem> languagesDropDownItems = [];
  List<DropdownMenuItem> countriesDropDownItems = [];
  String citiesDropDownValue = '';
  String languagesDropDownValue = '';
  String countriesDropDownValue = '';
  var proPic;
  String proPicBase64;

  ///have some work
  getCities()async{
    var url = Constants.apiEndpoint+"get_cities/?"
        "username=${env['API_USERNAME']}&"
        "password=${env['API_PASSWORD']}";

    var response = await http.post(
      url,
      headers: {
        'Authorization1': env['API_KEY'],
        'Content-Type': 'application/x-www-form-urlencoded'
      },
    );

    if(response.statusCode==200){
      var body = jsonDecode(response.body);
      setState(() {
        Map cities = body['OUTPUT'];

        for(int i=0;i<cities.length-2;i++){
          if(cities[i.toString()]['city_name'].containsKey(context.locale.toString().toLowerCase())){
            citiesDropDownItems.add(
                DropdownMenuItem(
                  child: Center(child: CustomText(text: cities[i.toString()]['city_name'][context.locale.toString().toLowerCase()],font: 'ubuntu',),
                  ),
                  value: cities[i.toString()]['city_id'],
                )
            );
          }
          else{
            citiesDropDownItems.add(
                DropdownMenuItem(
                  child: Center(child: CustomText(text: cities[i.toString()]['city_name']['fi'],font: 'ubuntu',),
                  ),
                  value: cities[i.toString()]['city_id'],
                )
            );
          }
        }

        citiesDropDownValue = cities['0']['city_id'];

      });
      // print(body);
    }
    else{
      print('error '+response.body);
    }
  }

  ///have some work
  getCountries()async{
    var url = Constants.apiEndpoint+"get_countries/?"
        "username=${env['API_USERNAME']}&"
        "password=${env['API_PASSWORD']}";

    var response = await http.post(
      url,
      headers: {
        'Authorization1': env['API_KEY'],
        'Content-Type': 'application/x-www-form-urlencoded'
      },
    );

    if(response.statusCode==200){
      var body = jsonDecode(response.body);
      setState(() {
        Map countries = body['OUTPUT'];

        for(int i=0;i<countries.length-2;i++){
          if(countries[i.toString()]['country_name'][context.locale.toString().toLowerCase()] is bool){
            countriesDropDownItems.add(
              DropdownMenuItem(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: ScreenUtil().setWidth(20),),
                    Container(
                      height: ScreenUtil().setHeight(37.5),
                      width: ScreenUtil().setWidth(50),
                      child: Image.asset('icons/flags/png/${countries[i
                          .toString()]['country_iso_code']
                          .toString()
                          .toLowerCase()}.png', package: 'country_icons'),
                    ),
                    Expanded(child: CustomText(
                      text: countries[i.toString()]['country_name']['fi'], font: 'ubuntu',))
                  ],
                ),
                value: countries[i.toString()]['country_id'],
              ),
            );
          }
          else {
            countriesDropDownItems.add(
              DropdownMenuItem(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: ScreenUtil().setWidth(20),),
                    Container(
                      height: ScreenUtil().setHeight(37.5),
                      width: ScreenUtil().setWidth(50),
                      child: Image.asset('icons/flags/png/${countries[i
                          .toString()]['country_iso_code']
                          .toString()
                          .toLowerCase()}.png', package: 'country_icons'),
                    ),
                    Expanded(child: CustomText(
                      text: countries[i.toString()]['country_name'][context
                          .locale.toString().toLowerCase()], font: 'ubuntu',))
                  ],
                ),
                value: countries[i.toString()]['country_id'],
              ),
            );
          }
          // print(countries[i.toString()]['country_id']);
        }

        countriesDropDownValue = countries['0']['country_id'];

      });
      // print(body);
    }
    else{
      print('error '+response.body);
    }
  }

  getLanguages()async{
    var url = Constants.apiEndpoint+"get_languages/?"
        "username=${env['API_USERNAME']}&"
        "password=${env['API_PASSWORD']}";

    var response = await http.post(
      url,
      headers: {
        'Authorization1': env['API_KEY'],
        'Content-Type': 'application/x-www-form-urlencoded'
      },
    );

    if(response.statusCode==200){
      var body = jsonDecode(response.body);
      setState(() {
        List languages = body['OUTPUT'];

        for(int i=0;i<languages.length;i++){
          languagesDropDownItems.add(
              DropdownMenuItem(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: ScreenUtil().setWidth(20),),
                    Container(
                      height: ScreenUtil().setHeight(37.5),
                      width: ScreenUtil().setWidth(50),
                      child: Image.asset('icons/flags/png/${languages[i]['flag']!='zh.png'?languages[i]['flag']:'cn.png'}', package: 'country_icons'),
                    ),
                    Expanded(child: CustomText(text: languages[i]['descrip'],font: 'ubuntu',))
                  ],
                ),
                value: languages[i]['code'].toString().toLowerCase(),
              )
          );
        }

        languagesDropDownValue = context.locale.toString().toLowerCase();

      });
      // print(body);
    }
    else{
      print('error '+response.body);
    }
  }

  getCustomer()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String password = prefs.getString('password');
    String emailAddress = prefs.getString('email');

    var url = Constants.apiEndpoint+"get_customer/?"
          "username=${env['API_USERNAME']}&"
          "password=${env['API_PASSWORD']}&"
          "email=$emailAddress&"
          "customer_password=$password";

      var response = await http.post(
        url,
        headers: {
          'Authorization1': env['API_KEY'],
          'Content-Type': 'application/x-www-form-urlencoded'
        },
      );

      if(response.statusCode==200){
        var body = jsonDecode(response.body);
       setState(() {
         Map customer = body['OUTPUT'];
         fullName.text = customer['firstname'];
         email.text = customer['email'];
         phone.text = customer['phone'];
         businessID.text = customer['business_id'] is bool?'':customer['business_id'];
         ad1.text = customer['address'] is bool?'':customer['address'];
         ad2.text = customer['address2'] is bool?'':customer['address2'];
         postal.text = customer['postal'] is bool?'':customer['postal'];
         state.text = customer['state'] is bool?'':customer['state'];
         state.text = customer['state'] is bool?'':customer['state'];

         ///shipping details
         shipping = customer['different_shipping_address']==0?'no':'yes';
         sAd1.text = customer['shipping_address'] is bool?'':customer['shipping_address'];
         sPostal.text = customer['shipping_postal'] is bool?'':customer['shipping_postal'];
         sState.text = customer['shipping_state'] is bool?'':customer['shipping_state'];
         orderingEmail.text = customer['ordering_email'] is bool?'':customer['ordering_email'];
         billingEmail.text = customer['billing_email'] is bool?'':customer['billing_email'];
         website.text = customer['website'] is bool?'':customer['website'];

         languagesDropDownValue = customer['language'];
         citiesDropDownValue = customer['city_id'];
         countriesDropDownValue = customer['country_id'];
         newsletter = customer['newsletter']==0?false:true;
         proPicBase64 = customer['image'][0];
         proPic = base64Decode(proPicBase64);
       });

      }
      else{
        ToastBar(text: tr('somethingWrong'),color: Colors.red).show();
      }


  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCities();
    getLanguages();
    getCountries();
    getCustomer();
  }

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
                        GestureDetector(
                          onTap: ()async{
                            final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
                            setState(() {
                              if (pickedFile != null) {
                                File image = File(pickedFile.path);
                                proPic = image.readAsBytesSync();
                                proPicBase64 = base64Encode(proPic);
                                print(proPicBase64);
                              } else {
                                ToastBar(text: tr('imageNotSelected'),color: Colors.red).show();
                              }
                            });
                          },
                          child: CircleAvatar(
                            backgroundColor: Theme.of(context).accentColor,
                            radius: 40,
                            child: proPic==null?Icon(Icons.person,color: Colors.white,size: 50,):null,
                            backgroundImage: proPic!=null?MemoryImage(proPic):null,
                          ),
                        ),

                        ///name
                        InputField(hint: tr('fullName'),controller: fullName,),
                        SizedBox(height: ScreenUtil().setHeight(30),),

                        ///email
                        InputField(hint: tr('email'),controller: email,),
                        SizedBox(height: ScreenUtil().setHeight(30),),


                        ///phone
                        InputField(
                          hint: tr('phoneNo'),
                          controller: phone,
                        ),
                        SizedBox(height: ScreenUtil().setHeight(30),),


                        ///language
                        Align(
                            alignment: Alignment.bottomLeft,
                            child: CustomText(text: tr('language'),font: 'ubuntu',align: TextAlign.start,size: ScreenUtil().setSp(32),)),
                        SizedBox(height: ScreenUtil().setHeight(25),),
                        languagesDropDownItems.isNotEmpty?Container(
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
                              items: languagesDropDownItems,
                              value: languagesDropDownValue,
                              onChanged: (val){
                                setState(() {
                                  languagesDropDownValue = val;
                                  Locale locale = Locale.fromSubtags(languageCode: languagesDropDownValue);
                                  String lStr = locale.toString();
                                  if(lStr.length==5){
                                      String language = lStr.substring(0,2);
                                      String country = lStr.substring(3,5);
                                      context.locale = Locale(language, country.toUpperCase());
                                  }
                                  else{
                                    context.locale = locale;
                                  }
                                });
                              },
                            ),
                          ),
                        ):LinearProgressIndicator(backgroundColor: Colors.white,),
                        SizedBox(height: ScreenUtil().setHeight(30),),


                        ///tradeName
                        InputField(hint: tr('tradeName'),controller: tradeName,),
                        SizedBox(height: ScreenUtil().setHeight(30),),

                        ///business
                        InputField(hint: tr('business'),controller: business,),
                        SizedBox(height: ScreenUtil().setHeight(30),),

                        ///businessID
                        InputField(hint: tr('businessID'),controller: businessID,),
                        SizedBox(height: ScreenUtil().setHeight(30),),

                        ///addLine1
                        InputField(hint: tr('addressLine1'),controller: ad1,),
                        SizedBox(height: ScreenUtil().setHeight(30),),

                        ///addLine2
                        InputField(hint: tr('addressLine2'),controller: ad2,),
                        SizedBox(height: ScreenUtil().setHeight(30),),

                        ///postal
                        InputField(hint: tr('postal'),controller: postal,),
                        SizedBox(height: ScreenUtil().setHeight(30),),

                        ///state
                        InputField(hint: tr('state'),controller: state,),
                        SizedBox(height: ScreenUtil().setHeight(30),),

                        ///cityID
                        Align(
                            alignment: Alignment.bottomLeft,
                            child: CustomText(text: tr('cityID'),font: 'ubuntu',align: TextAlign.start,size: ScreenUtil().setSp(32),)),
                        SizedBox(height: ScreenUtil().setHeight(25),),
                        citiesDropDownItems.isNotEmpty?Container(
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
                              value: citiesDropDownValue,
                              items: citiesDropDownItems,
                              onChanged: (val){
                                setState(() {
                                      citiesDropDownValue = val;
                                });
                              },
                            ),
                          ),
                        ):LinearProgressIndicator(backgroundColor: Colors.white,),
                        SizedBox(height: ScreenUtil().setHeight(30),),


                        ///countryID
                        Align(
                            alignment: Alignment.bottomLeft,
                            child: CustomText(text: tr('countryID'),font: 'ubuntu',align: TextAlign.start,size: ScreenUtil().setSp(32),)),
                        SizedBox(height: ScreenUtil().setHeight(25),),
                        countriesDropDownItems.isNotEmpty?Container(
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
                              items: countriesDropDownItems,
                              value: countriesDropDownValue,
                              onChanged: (val){
                                setState(() {
                                  countriesDropDownValue = val;
                                });
                              },
                            ),
                          ),
                        ):LinearProgressIndicator(backgroundColor: Colors.white,),
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
                                   value: 'yes',
                                   groupValue: shipping,
                                   onChanged: (val){
                                     setState(() {
                                       shipping = val;
                                     });
                                   },
                                   title: CustomText(text: tr('yes'),align: TextAlign.end,),
                                   controlAffinity: ListTileControlAffinity.trailing,
                                   activeColor: Theme.of(context).accentColor,
                               ),
                             ),
                            Expanded(
                              child: RadioListTile(
                                value: 'no',
                                groupValue: shipping,
                                onChanged: (val){
                                  setState(() {
                                    shipping = val;
                                  });
                                },
                                title: CustomText(text: tr('no'),align: TextAlign.end,),
                                controlAffinity: ListTileControlAffinity.trailing,
                                activeColor: Theme.of(context).accentColor,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: ScreenUtil().setHeight(30),),


                        ///shippingAddressLine1
                        if(shipping=='yes')
                        InputField(hint: tr('shippingAddressLine1'),controller: sAd1,),
                        if(shipping=='yes')
                        SizedBox(height: ScreenUtil().setHeight(30),),

                        ///shippingAddressLine2
                        if(shipping=='yes')
                        InputField(hint: tr('shippingAddressLine2'),controller: sAd2,),
                        if(shipping=='yes')
                        SizedBox(height: ScreenUtil().setHeight(30),),


                        ///shippingCityID
                        if(shipping=='yes')
                        Align(
                            alignment: Alignment.bottomLeft,
                            child: CustomText(text: tr('shippingCityID'),font: 'ubuntu',align: TextAlign.start,size: ScreenUtil().setSp(32),)),
                        if(shipping=='yes')
                        SizedBox(height: ScreenUtil().setHeight(25),),
                        if(shipping=='yes')
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
                        if(shipping=='yes')
                        SizedBox(height: ScreenUtil().setHeight(30),),


                        ///shippingPostal
                        if(shipping=='yes')
                        InputField(hint: tr('shippingPostal'),controller: sPostal,),
                        if(shipping=='yes')
                        SizedBox(height: ScreenUtil().setHeight(30),),

                        ///shippingState
                        if(shipping=='yes')
                        InputField(hint: tr('shippingState'),controller: sState,),
                        if(shipping=='yes')
                        SizedBox(height: ScreenUtil().setHeight(30),),


                        ///orderingEmail
                        InputField(hint: tr('orderingEmail'),controller: orderingEmail,type: TextInputType.emailAddress,),
                        SizedBox(height: ScreenUtil().setHeight(30),),

                        ///billingEmail
                        InputField(hint: tr('billingEmail'),type: TextInputType.emailAddress,controller: billingEmail,),
                        SizedBox(height: ScreenUtil().setHeight(30),),

                        ///website
                        InputField(hint: tr('website'),controller: website,type: TextInputType.url,),
                        SizedBox(height: ScreenUtil().setHeight(30),),


                        ///newsletter
                        Align(
                          alignment: Alignment.centerLeft,
                          child: CheckboxListTile(
                              value: newsletter,
                              onChanged: (val){
                                setState(() {
                                  newsletter = val;
                                });
                              },
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

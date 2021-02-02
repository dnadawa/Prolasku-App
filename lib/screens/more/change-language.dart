import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prolasku/widgets/custom-text.dart';
import 'package:prolasku/widgets/radio-list-item.dart';
import 'package:http/http.dart' as http;

import '../../constants.dart';

class ChangeLanguage extends StatefulWidget {
  @override
  _ChangeLanguageState createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {

  List languages;
  String selected;
  
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
        languages = body['OUTPUT'];
        selected = context.locale.toString().toLowerCase();
      });
    }
    else{
      print('error '+response.body);
    }
  }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLanguages();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: tr('languageChange'),font: 'ubuntu',),
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(ScreenUtil().setWidth(20)),
        child: languages!=null?ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: languages.length,
          itemBuilder: (context,i){

            String code = languages[i]['code'].toString();
            String name = languages[i]['descrip'];

            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 5,
              color: Theme.of(context).primaryColor,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.horizontal(left: Radius.circular(10)),
                        color: Theme.of(context).accentColor
                    ),
                    child: SizedBox(
                      width: ScreenUtil().setWidth(115),
                      height: ScreenUtil().setWidth(115),
                      child: Padding(
                        padding: EdgeInsets.all(ScreenUtil().setWidth(25)),
                        child: Image.asset('assets/images/shopWhite.png'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      title: CustomText(text: name,isBold: false,),
                      value: code,
                      groupValue: selected,
                      onChanged: (val){
                        setState(() {
                          selected = val;
                          Locale locale = Locale.fromSubtags(languageCode: selected);
                          print(locale);
                          if(locale.toString()=="en_gb"){
                            context.locale = Locale('en', 'GB');
                          }
                          else{
                            context.locale = locale;
                          }
                        });
                      },
                      controlAffinity: ListTileControlAffinity.trailing,
                      activeColor: Theme.of(context).accentColor,
                    ),
                  ),
                ],
              ),
            );
          },
        ):Center(child: CircularProgressIndicator(),),
      ),
    );
  }
}

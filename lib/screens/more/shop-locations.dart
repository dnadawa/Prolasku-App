import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prolasku/widgets/custom-text.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';
class ShopLocations extends StatefulWidget {
  @override
  _ShopLocationsState createState() => _ShopLocationsState();
}

class _ShopLocationsState extends State<ShopLocations> {
  SharedPreferences prefs;

  List locations;
  String selected;
  getLocations() async {
    prefs = await SharedPreferences.getInstance();
    String initLocation = prefs.getString('location');
    String url = Constants.apiEndpoint+"get_locations/?username=${env['API_USERNAME']}&password=${env['API_PASSWORD']}";
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
        locations = body['OUTPUT'];
        selected = initLocation;
      });
    }
    else{
      print('error'+response.statusCode.toString());
      print(response.body);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: tr('shopLocations'),font: 'ubuntu',),
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(ScreenUtil().setWidth(20)),
        child: locations!=null?ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: locations.length,
          itemBuilder: (context,i){

            String name = locations[i]['name'];
            String id = locations[i]['location_id'];

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
                      value: name,
                      groupValue: selected,
                      onChanged: (val){
                        setState(() {
                          selected = val;
                          prefs.setString('location', selected);
                          prefs.setString('locationID', id);
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

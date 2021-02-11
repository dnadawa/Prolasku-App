import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:prolasku/widgets/custom-text.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../constants.dart';
import 'package:easy_localization/easy_localization.dart';

class Brands extends StatefulWidget {
  @override
  _BrandsState createState() => _BrandsState();
}

class _BrandsState extends State<Brands> {

  List brands;
  ScrollController _controller = ScrollController();
  SharedPreferences prefs;
  int start = 0;
  int maxItemsCount = 0;
  getCategories() async {
    prefs = await SharedPreferences.getInstance();
    String url = Constants.apiEndpoint+"get_brands/?username=${env['API_USERNAME']}&password=${env['API_PASSWORD']}&start=${start*50}&limit=50";
    print(url);
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
        if(brands==null){
          brands = body['OUTPUT'];
        }else{
          brands = brands + body['OUTPUT'];
        }

        maxItemsCount = int.parse(body['INFO']['total_count']);
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
    getCategories();
    _controller.addListener(() {
      if(_controller.position.pixels == _controller.position.maxScrollExtent){
        start++;
        getCategories();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return brands!=null?ListView.builder(
      controller: _controller,
      itemCount: brands.length+1,
      itemBuilder: (context,i){
        if(i==brands.length){
          if(i!=maxItemsCount) {
            return CupertinoActivityIndicator();
          }
          else{
            return Container();
          }
        }

        String name;
        if(brands[i]['brand_name'][context.locale.toString().toLowerCase()] is bool){
              name = brands[i]['brand_name']['fi'];
        }else{
          name = brands[i]['brand_name'][context.locale.toString().toLowerCase()];
        }

        String bid = brands[i]['bid'];
        bool isSelected = prefs.getBool("B"+bid)??false;


        return Row(
          children: [
            Checkbox(value: isSelected, onChanged: (val){
              setState(() {
                isSelected = val;
                prefs.setBool("B"+bid, isSelected);
                List<String> selected = prefs.getStringList('brands')??[];
                if(isSelected){
                  selected.add(bid);
                }
                else{
                  selected.remove(bid);
                }
                prefs.setStringList('brands', selected);

              });
              },),
            CustomText(text: name,align: TextAlign.start,),
          ],
        );
      },
    ):Center(child: CircularProgressIndicator(),);
  }
}

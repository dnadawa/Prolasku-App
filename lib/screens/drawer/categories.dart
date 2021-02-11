import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:prolasku/widgets/custom-text.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../constants.dart';
import 'package:easy_localization/easy_localization.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  List categories;
  ScrollController _controller = ScrollController();
  SharedPreferences prefs;
  int start = 0;
  int maxItemsCount = 0;
  getCategories() async {
    prefs = await SharedPreferences.getInstance();
    String url = Constants.apiEndpoint+"get_categories/?username=${env['API_USERNAME']}&password=${env['API_PASSWORD']}&start=${start*50}&limit=50";
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
        if(categories==null){
          categories = body['OUTPUT'];
        }else{
          categories = categories + body['OUTPUT'];
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
    return categories!=null?ListView.builder(
      controller: _controller,
      itemCount: categories.length+1,
      itemBuilder: (context,i){
        if(i==categories.length){
          if(i!=maxItemsCount) {
            return CupertinoActivityIndicator();
          }
          else{
            return Container();
          }
        }

        String name;
        if(categories[i]['category_name'][context.locale.toString().toLowerCase()] is bool){
              name = categories[i]['category_name']['fi'];
        }else{
          name = categories[i]['category_name'][context.locale.toString().toLowerCase()];
        }

        String cid = categories[i]['cid'];
        bool isSelected = prefs.getBool(cid)??false;


        return Row(
          children: [
            Checkbox(value: isSelected, onChanged: (val){
              setState(() {
                isSelected = val;
                prefs.setBool(cid, isSelected);
                List<String> selected = prefs.getStringList('categories')??[];
                if(isSelected){
                  selected.add(cid);
                }
                else{
                  selected.remove(cid);
                }
                prefs.setStringList('categories', selected);

              });
              },),
            CustomText(text: name,align: TextAlign.start,),
          ],
        );
      },
    ):Center(child: CircularProgressIndicator(),);
  }
}

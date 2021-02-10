import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:prolasku/widgets/custom-text.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../constants.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  List categories;
  ScrollController _controller = ScrollController();

  getCategories() async {
    String url = Constants.apiEndpoint+"get_categories/?username=${env['API_USERNAME']}&password=${env['API_PASSWORD']}&start=0&limit=50";
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
        categories = body['OUTPUT'];
        print(body);
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
        print('max reached');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: _controller,
      children: [
        Row(
          children: [
            Checkbox(value: true, onChanged: (val){},),
            CustomText(text: 'Rice Bags',align: TextAlign.start,),
          ],
        ),
        Row(
          children: [
            Checkbox(value: true, onChanged: (val){},),
            CustomText(text: 'Rice Bags',align: TextAlign.start,),
          ],
        )
      ],
    );
  }
}

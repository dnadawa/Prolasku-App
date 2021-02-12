import 'dart:async';
import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prolasku/widgets/custom-text.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoyaltyCard extends StatefulWidget {
  @override
  _LoyaltyCardState createState() => _LoyaltyCardState();
}

class _LoyaltyCardState extends State<LoyaltyCard> {

  String barcodeText;

  generateBarcode()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String cid = prefs.getString('cid');
    String cr = prefs.getString('cr');
    DateTime now = DateTime.now();
    String date = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);

    Map map = {
      'loyaltycard':[
        {
          'customer': {
            cid: cr
          },
          'data_time':{
            "0":date
          }
        }
      ]
    };

    String json = jsonEncode(map);
    var bytes = utf8.encode(json);
    var base64 = base64Encode(bytes);
    if(this.mounted){
      setState(() {
        barcodeText = base64;
      });
    }
    print(barcodeText);
  }
  Timer x;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    generateBarcode();
    x = Timer.periodic(Duration(seconds: 60), (t){generateBarcode();});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    x.cancel();
    print('dispose called');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: tr('loyaltyCard'),font: 'ubuntu',),
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: QrImage(
          data: barcodeText,
          version: QrVersions.auto,
          size: ScreenUtil().setHeight(500)
        ),
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prolasku/widgets/custom-text.dart';

class Policy extends StatelessWidget {

  final String title;
  final String text;

  const Policy({Key key, this.title, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: tr(title),font: 'ubuntu',),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ScreenUtil().setWidth(30)),
          child: CustomText(
            text: text,
            isBold: false,
            align: TextAlign.start,
            height: 1.4,
          ),
        ),
      ),
    );
  }
}

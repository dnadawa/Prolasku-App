import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:prolasku/widgets/custom-text.dart';

class DigitalPDFNewsletter extends StatefulWidget {
  @override
  _DigitalPDFNewsletterState createState() => _DigitalPDFNewsletterState();
}

class _DigitalPDFNewsletterState extends State<DigitalPDFNewsletter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: CustomText(text: tr('digitalPDFNewsletter'),font: 'ubuntu',),
          elevation: 0,
          centerTitle: true,
        ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: ScreenUtil().setWidth(20),
            mainAxisSpacing: ScreenUtil().setWidth(20),
            childAspectRatio: 4/5
        ),
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(ScreenUtil().setWidth(20)),
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            elevation: 5,
            color: Colors.white,
            child: Image.network("https://venngage-wordpress.s3.amazonaws.com/uploads/2020/06/Real-Estate-Marketing-Tips-Email-Newsletter-Template.png",fit: BoxFit.fill,),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            elevation: 5,
            color: Colors.white,
            child: Image.network("https://venngage-wordpress.s3.amazonaws.com/uploads/2020/06/Real-Estate-Marketing-Tips-Email-Newsletter-Template.png",fit: BoxFit.fill,),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            elevation: 5,
            color: Colors.white,
            child: Image.network("https://venngage-wordpress.s3.amazonaws.com/uploads/2020/06/Real-Estate-Marketing-Tips-Email-Newsletter-Template.png",fit: BoxFit.fill,),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            elevation: 5,
            color: Colors.white,
            child: Image.network("https://venngage-wordpress.s3.amazonaws.com/uploads/2020/06/Real-Estate-Marketing-Tips-Email-Newsletter-Template.png",fit: BoxFit.fill,),
          ),
        ],
      ),
    );
  }
}

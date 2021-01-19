import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prolasku/widgets/custom-text.dart';

class Receipts extends StatefulWidget {
  @override
  _ReceiptsState createState() => _ReceiptsState();
}

class _ReceiptsState extends State<Receipts>{


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: CustomText(text: tr('receipts'),font: 'ubuntu',),
          elevation: 0,
          centerTitle: true,
          bottom: TabBar(
            isScrollable: true,
            onTap: (i){
              print(i);
            },
            unselectedLabelColor: Color(0xffa4a4a4),
            labelColor: Theme.of(context).accentColor,
            tabs: [
              Tab(text: 'December 2020',),
              Tab(text: 'December 2020',),
              Tab(text: 'December 2020',),
              Tab(text: 'December 2020',),
              Tab(text: 'December 2020',),
              Tab(text: 'December 2020',),
              Tab(text: 'December 2020',),
              Tab(text: 'December 2020',),
            ],
          ),
        ),


        body: Padding(
          padding: EdgeInsets.all(ScreenUtil().setHeight(20)),
          child: ListView(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                color: Theme.of(context).primaryColor,
                elevation: 5,
                child: ListTile(
                  leading: Icon(Icons.receipt_long_rounded,color: Theme.of(context).accentColor,size: 35,),
                  title: CustomText(text: 'Helsinki store',font: 'ubuntu',color: Theme.of(context).accentColor,align: TextAlign.start,size: ScreenUtil().setSp(35),),
                  subtitle: CustomText(text: '10.01.2021  10:30',font: 'ubuntu',align: TextAlign.start,isBold: false,),
                  trailing: CustomText(text: '2,11€',font: 'josefin',align: TextAlign.start,size: ScreenUtil().setSp(45),),

                ),
              )
            ],
          ),
        ),

      ),
    );
  }
}

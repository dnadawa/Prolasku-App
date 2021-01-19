import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

import 'custom-text.dart';

class Button extends StatelessWidget {
  final String text;
  final double borderRadius;
  final Function onPressed;
  final double fontSize;
  final bool isCart;

  const Button({Key key, this.text, this.borderRadius=40, this.onPressed, this.fontSize=40, this.isCart=false}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      color: Theme.of(context).accentColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius)
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(text: text,color: Colors.white,size: ScreenUtil().setHeight(fontSize),),
          if(isCart)
            SizedBox(width: ScreenUtil().setWidth(40),),
          if(isCart)
          Container(
            width: ScreenUtil().setWidth(50),
            height: ScreenUtil().setWidth(50),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Icon(Icons.shopping_cart,color: Theme.of(context).accentColor,size: 18,),
          )
        ],
      ),
    );
  }
}

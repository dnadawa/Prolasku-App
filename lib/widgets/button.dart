import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

import 'custom-text.dart';

class Button extends StatelessWidget {
  final String text;
  final double borderRadius;
  final Function onPressed;
  final double fontSize;

  const Button({Key key, this.text, this.borderRadius=40, this.onPressed, this.fontSize=40}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      color: Theme.of(context).accentColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius)
      ),
      child: CustomText(text: text,color: Colors.white,size: ScreenUtil().setHeight(fontSize),),
    );
  }
}

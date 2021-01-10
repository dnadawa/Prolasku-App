import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {

  final String text;
  final double size;
  final Color color;
  final TextAlign align;
  final bool isBold;
  final String font;
  final double height;
  const CustomText({Key key, this.text, this.size, this.color=Colors.black, this.align=TextAlign.center, this.isBold=true, this.font, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    TextStyle style = TextStyle(
        color: color,
        fontWeight: isBold?FontWeight.bold:FontWeight.normal,
        fontSize: size,
        height: height
    );


    return Text(
      text,
      textAlign: align,
      style: font==null?style:font=='ubuntu'?GoogleFonts.ubuntu(textStyle: style):GoogleFonts.josefinSans(textStyle: style),
    );
  }
}
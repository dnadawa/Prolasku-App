import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputField extends StatelessWidget {

  final String hint;
  final TextInputType type;
  final bool isPassword;
  final TextEditingController controller;
  final Widget suffix;
  final Widget prefix;

  const InputField({Key key, this.hint, this.type, this.isPassword=false, this.controller, this.suffix, this.prefix}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: GoogleFonts.ubuntu(
        color: Colors.black
      ),
      keyboardType: type,
      controller: controller,
      obscureText: isPassword,
      cursorColor: Theme.of(context).accentColor,
      decoration: InputDecoration(
        suffix: suffix,
        labelText: hint,
        prefix: prefix,
        labelStyle: GoogleFonts.ubuntu(
          color: Colors.black,
          fontWeight: FontWeight.bold
        ),
        enabledBorder:UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2),
        ),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 4),
        ),
      ),
    );
  }
}
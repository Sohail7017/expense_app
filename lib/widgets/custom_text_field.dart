

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class CustomTextField extends StatelessWidget{

  double mWidth;
  int minLines;
  TextEditingController mController;
  String hintText;
  TextStyle? hintStyle;
  String labelText;
  IconData? prefixIcon;
 IconData? suffixIcon;
 TextInputType mKeyBoard;


  CustomTextField({this.mWidth = double.infinity, this.minLines = 1 ,required this.mController, required this.hintText, this.hintStyle  ,required this.labelText, this.prefixIcon, this.suffixIcon, this.mKeyBoard= TextInputType.text});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: mWidth,
      child: TextField(
        minLines: minLines,
        maxLines: minLines,
        keyboardType: mKeyBoard,
        controller: mController ,
        decoration:  InputDecoration(
          label: Text(labelText),
          hintText: hintText,
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
          enabledBorder: myBorder(borderRadius: 15,borderWidth: 1,borderColor: Theme.of(context).brightness==Brightness.light ? Colors.black : Colors.white),
          focusedBorder: myBorder(borderColor: Color(0xff6574D3),borderRadius: 15)
        ),
      ),
    );
  }
  InputBorder myBorder({Color borderColor = Colors.black, double borderRadius = 5 , double borderWidth = 1.1 }) {
     return OutlineInputBorder(
       borderRadius: BorderRadius.circular(borderRadius),
       borderSide: BorderSide(width: borderWidth,color: borderColor)
     );
}

}
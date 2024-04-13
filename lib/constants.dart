import 'package:flutter/material.dart';

const Color lblue = Color(0xffD3E7FF);
const Color darkBlue = Color(0xff7BB7FF);
const Color lpink = Color(0xffFFD3DB);
const Color darkPink = Color(0xffFFA4BF);
const Color lyellow = Color(0xffFFF5D3);
const Color darkYellow = Color(0xffFFD27B);
const Color fontColor = Color(0xff12151B);
const Color grey = Color(0xffD3E7FF);

const kHeading = TextStyle(color: fontColor,fontFamily: 'AbrilFatface',fontSize: 43);
const kText = TextStyle(color: fontColor,fontFamily: 'Montserrat',fontSize: 15);
const kboldText = TextStyle(color: fontColor,fontFamily: 'Montserrat',fontWeight:FontWeight.bold,fontSize: 13);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',

  hintStyle:
  TextStyle(color: Colors.grey, fontSize: 12, fontFamily: 'Montserrat'),
  filled: true,
  fillColor: Colors.transparent,
  contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
  border: OutlineInputBorder(
    borderSide: BorderSide(color: darkBlue, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(2.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: darkBlue, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(2.0)),
  ),
);
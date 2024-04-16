import 'package:flutter/material.dart';

const Color fontColor = Color(0xff1B1212);
const Color bgColor = Color(0xffF0F0F0);
const Color peach = Color(0xffFF7567);
const Color lpeach = Color(0xffFFE2DF);
const Color darkPeach = Color(0xffCB4234);

const kHeading = TextStyle(color: fontColor,fontFamily: 'AbrilFatface',fontSize: 43);
const kText = TextStyle(color: fontColor,fontFamily: 'Montserrat',fontSize: 15);
const kboldText = TextStyle(color: darkPeach,fontFamily: 'Montserrat',fontWeight:FontWeight.bold,fontSize: 13);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',

  hintStyle:
  TextStyle(color: Colors.grey, fontSize: 12, fontFamily: 'Montserrat'),
  filled: true,
  fillColor: Colors.transparent,
  contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
  border: OutlineInputBorder(
    borderSide: BorderSide(color: fontColor, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(2.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: peach, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(2.0)),
  ),
);

Widget boxWidget(Widget child) {
  return Container(
    //height: 100,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(7),
      boxShadow: [
        BoxShadow(color: Colors.grey.withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 5,
          offset: Offset(0, 3),)
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(8, 20, 8, 20),
      child: child,
    ),
  );
}
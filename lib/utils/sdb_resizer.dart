import 'package:flutter/material.dart';

class SDP{
  static late int dimen;
  static late double width;
  static late BuildContext c;

  static void init(BuildContext context){
    c = context;
    width = MediaQuery.of(c).size.width;
  }

  static double sdp(double dp) {
    return (dp / 300) * width;
  }
}
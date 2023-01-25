import 'package:flutter/material.dart';

hexcolor(String hexcolor) {
  String color = '0xff' + hexcolor;
  int colorint = int.parse(color);
  return colorint;
}
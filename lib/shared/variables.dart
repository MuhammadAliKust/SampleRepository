import 'package:flutter/material.dart';

var containerDecoration = BoxDecoration(
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(40), topRight: Radius.circular(40)),
    color: Color(0xfff6f3ff));

var containerImageDecoration = BoxDecoration(
  image: DecorationImage(
    image: AssetImage("assets/images/driver.png"),
    fit: BoxFit.fitWidth,
  ),
);

var headingStyle = TextStyle(
    height: 1.3,
    color: Color(0xff4c36ad),
    fontSize: 21,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.1);

import 'package:flutter/material.dart';

Widget customAppbar(String title){
  return AppBar(
        title: Text(
          title,
          style: TextStyle(color: Color(0xff707070), fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 10,
        centerTitle: true,
      );
}
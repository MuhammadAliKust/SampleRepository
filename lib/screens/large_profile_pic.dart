import 'package:flutter/material.dart';

class LargerPic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(tag: 'light1', child: Image.asset('assets/images/job.png')),
    );
  }
}

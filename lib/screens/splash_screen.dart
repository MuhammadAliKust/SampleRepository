import 'dart:async';
import 'package:bus_app/routes/routing_constants.dart';
import 'package:bus_app/screen_resolution.dart/screen_resolution.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Widget _buildScreenUI() {
    return Center(
        child: Image.asset(
      'assets/images/logo.png',
      width: 0.5 * screenWidth(context),
    ));
  }

  Widget _buildTopImage() {
    return Positioned(right: -20, child: Image.asset('assets/images/bg.png'));
  }

  Widget _buildBottomImage() {
    return Positioned(
        bottom: 10, left: -30, child: Image.asset('assets/images/bg.png'));
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.of(context).pop();
      Navigator.pushReplacementNamed(context, AuthenticationMenu);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            _buildTopImage(),
            _buildScreenUI(),
            _buildBottomImage(),
          ],
        ),
      ),
    );
  }
}

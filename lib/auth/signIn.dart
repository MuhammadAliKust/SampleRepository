import 'package:auto_size_text/auto_size_text.dart';
import 'package:bus_app/routes/routing_constants.dart';
import 'package:bus_app/screen_resolution.dart/screen_resolution.dart';
import 'package:bus_app/shared/variables.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  bool isDriver = false;
  SignIn({this.isDriver=false});
  final _formKey = GlobalKey<FormState>();
  Widget _buildScreen(BuildContext context) {
    return Container(
      decoration: containerImageDecoration,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 190),
            _buildScreenUI(context),
          ],
        ),
      ),
    );
  }

  Widget _buildScreenUI(BuildContext context) {
    return Column(children: [
      Container(
        decoration: containerDecoration,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Container(
              child: Column(children: <Widget>[
                SizedBox(height: 30),
                _buildHeader(context),
                SizedBox(height: 20),
                _buildHeading(),
                SizedBox(height: 30),
                Form(
                  key: _formKey,
                  child: Column(children: <Widget>[
                    _buildIdField(),
                    SizedBox(
                      height: 20,
                    ),
                    !isDriver ? _buildPwdField() : Container(),
                    SizedBox(height: 30),
                    _buildFlatButton(context),
                    SizedBox(height: 20),
                  ]),
                ),
              ]),
            )),
      ),
    ]);
  }

  Widget _buildHeader(BuildContext context) {
    return Image.asset(
      'assets/images/logo.png',
      width: 0.38 * screenWidth(context),
    );
  }

  Widget _buildHeading() {
    return Text('login'.toUpperCase(), style: headingStyle);
  }

  Widget _buildIdField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: TextFormField(
        validator: (val) => val.isEmpty ? 'ID No. cannot be empty' : null,
        style: TextStyle(color: Color(0xff4c36ad)),
        decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xff4c36ad))),
            hintText: 'Enter your ID Number',
            hintStyle: TextStyle(color: Color(0xff4c36ad))),
      ),
    );
  }

  Widget _buildPwdField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: TextFormField(
        validator: (val) => val.isEmpty ? 'Password cannot be empty' : null,
        decoration: InputDecoration(
            hintText: 'Enter your password',
            hintStyle: TextStyle(color: Color(0xff4c36ad))),
      ),
    );
  }

  Widget _buildFlatButton(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25))),
      color: Color(0xff6135bc),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        child: AutoSizeText(
          'SignIn',
          style: TextStyle(color: Colors.white, fontSize: 20, letterSpacing: 1),
          maxLines: 1,
        ),
      ),
      onPressed: () {
        if(!_formKey.currentState.validate()){
          return;
        }
        Navigator.pushReplacementNamed(context, DashboardView);
      },
    );
  }

  Widget _buildBottomImage() {
    return Positioned(
        bottom: -80,
        left: -30,
        child: Image.asset(
          'assets/images/bg.png',
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        _buildScreen(context),
        _buildBottomImage(),
      ],
    )));
  }
}

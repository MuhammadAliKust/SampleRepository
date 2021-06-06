import 'package:auto_size_text/auto_size_text.dart';
import 'package:bus_app/routes/routing_constants.dart';
import 'package:bus_app/screen_resolution.dart/screen_resolution.dart';
import 'package:flutter/material.dart';

class UnDefinedView extends StatelessWidget {
  final String name;
  UnDefinedView({this.name});
  Widget _buildButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 38.0),
      child: FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25))),
        color: Color(0xff6135bc),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
          child: AutoSizeText(
            'Go To HomePage',
            style:
                TextStyle(color: Colors.white, fontSize: 20, letterSpacing: 1),
            maxLines: 1,
          ),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/404.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: <Widget>[
              Positioned(
                bottom: 50,
                child: _buildButton(context)),
            ],
          )),
    ));
  }
}

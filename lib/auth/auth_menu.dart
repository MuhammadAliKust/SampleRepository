import 'package:bus_app/auth/signIn.dart';
import 'package:bus_app/elemets/card.dart';
import 'package:bus_app/routes/routing_constants.dart';
import 'package:bus_app/screens/undefined_view.dart';
import 'package:bus_app/shared/variables.dart';
import 'package:flutter/material.dart';

class AuthMenu extends StatelessWidget {
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
            child: Column(children: <Widget>[
              _buildSizeBox(),
              _buildHeader(),
              SizedBox(height: 10),
              Divider(
                thickness: 1,
              ),
              _buildSizeBox(),
              buildCard(
                  context,
                  'assets/images/job.png',
                  () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SignIn(isDriver: true))),
                  '',
                  'Driver'),
              SizedBox(height: 10),
              buildCard(
                  context,
                  'assets/images/job.png',
                  () => Navigator.pushNamed(context, LoginPageView),
                  '',
                  'Assistant'),
              SizedBox(height: 10),
              buildCard(
                  context,
                  'assets/images/job.png',
                  () => Navigator.pushNamed(context, LoginPageView),
                  '',
                  'Logistic'),
              SizedBox(height: 20),
            ])),
      ),
    ]);
  }

  Widget _buildSizeBox() {
    return SizedBox(height: 30);
  }

  Widget _buildHeader() {
    return Column(children: <Widget>[
      _buildHeading(),
      SizedBox(
        height: 10,
      ),
      _buildSubHeading()
    ]);
  }

  Widget _buildHeading() {
    return Text('welcome to\nshahnwaz bus app'.toUpperCase(),
        textAlign: TextAlign.center, style: headingStyle);
  }

  Widget _buildSubHeading() {
    return Text(
      'All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary,',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.w400,
        height: 1.2,
        fontSize: 14,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: _buildScreen(context)));
  }
}

import 'package:bus_app/elemets/card.dart';
import 'package:bus_app/routes/routing_constants.dart';
import 'package:bus_app/shared/variables.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatelessWidget {
  Widget _buildAppBar() {
    return AppBar(
      leading: Icon(
        Icons.arrow_back_ios,
        color: Color(0xff9f9fa0),
        size: 18,
      ),
      backgroundColor: Color(0xfff6f3ff),
      elevation: 0,
    );
  }

  Widget _buildScreenUI(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 30),
            _buildHeader(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(
                thickness: 1,
              ),
            ),
            _buildPageTitle(),
            SizedBox(height: 20),
            buildCard(
                context,
                'assets/images/job.png',
                () => Navigator.pushNamed(context, FleetCheckUp),
                'Fleet CheckUp'),
            SizedBox(height: 10),
            buildCard(context, 'assets/images/job.png',
                () => Navigator.pushNamed(context, 'No Route'), 'Message'),
            SizedBox(height: 10),
            buildCard(context, 'assets/images/job.png',
                () => Navigator.pushNamed(context, 'No Route'), 'Accident'),
          ]),
    );
  }

  Widget _buildHeader() {
    return Text(
      'welcome\nmr xyz'.toUpperCase(),
      style: headingStyle,
    );
  }

  Widget _buildPageTitle() {
    return Text('dasboard'.toUpperCase(),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ));
  }

  Widget _buildBottomImage() {
    return Positioned(
        bottom: 10, left: -20, child: Image.asset('assets/images/bg.png'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            _buildScreenUI(context),
            _buildBottomImage(),
          ],
        ),
      ),
    );
  }
}

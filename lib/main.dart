import 'package:bus_app/auth/auth_menu.dart';
import 'package:bus_app/auth/signIn.dart';
import 'package:bus_app/routes/routing_constants.dart';
import 'package:bus_app/screens/dashboard.dart';
import 'package:bus_app/screens/pre_trip_cheklist.dart';
import 'package:bus_app/screens/splash_screen.dart';
import 'package:bus_app/routes/router.dart' as Router;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

void main()  {
  // debugPaintSizeEnabled = true;
  // debugPaintBaselinesEnabled = true;
  //  debugPaintPointersEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        canvasColor: Color(0xfff6f3ff),
      ),
      onGenerateRoute: Router.generateRoute,
      initialRoute: FleetCheckUp,
    );
  }
}

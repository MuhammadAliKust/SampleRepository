import 'package:bus_app/auth/auth_menu.dart';
import 'package:bus_app/auth/signIn.dart';
import 'package:bus_app/routes/routing_constants.dart';
import 'package:bus_app/screens/dashboard.dart';
import 'package:bus_app/screens/pre_trip_cheklist.dart';
import 'package:bus_app/screens/splash_screen.dart';
import 'package:bus_app/screens/undefined_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case Splash:
      return MaterialPageRoute(builder: (context) => SplashScreen());
    case LoginPageView:
      return MaterialPageRoute(builder: (context) => SignIn());
    case DashboardView:
      return MaterialPageRoute(builder: (context) => DashBoard());
    case AuthenticationMenu:
      return MaterialPageRoute(builder: (context) => AuthMenu());
    case FleetCheckUp:
      return MaterialPageRoute(builder: (context) => PreTripCheckList());
    default:
      return MaterialPageRoute(
          builder: (context) => UnDefinedView(name: routeSettings.name));
  }
}

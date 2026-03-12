import 'package:flight_booking/presentation/flight/flight.dart';
import 'package:flight_booking/presentation/home/home.dart';
import 'package:flutter/material.dart';
import '../presentation/splash_screen/splash_screen.dart';

class AppRoutes {

  static const String splashScreen = '/splash_screen';
  static const String initialRoute = '/';
  static const String home = '/home';
  static const String flight = '/flight';


  static Map<String, WidgetBuilder> get routes => {
    splashScreen: (context) => SplashScreen(),
    initialRoute: (context) => SplashScreen(),
    home: (context) => Home(),
    flight: (context) => Flight()
  };

}

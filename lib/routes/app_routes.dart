import 'package:flutter/material.dart';
import '../presentation/splash_screen/splash_screen.dart';

class AppRoutes {

  static const String splashScreen = '/splash_screen';
  static const String initialRoute = '/';


  static Map<String, WidgetBuilder> get routes => {
    splashScreen: (context) => SplashScreen(),
    initialRoute: (context) => SplashScreen(),
  };

}

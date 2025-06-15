import 'package:craft_bay/features/auth/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes{
  static Route<dynamic> getRoutes(RouteSettings settings){
    late final Widget screenWidget;
    if(settings.name == SplashScreen.name){
      screenWidget = SplashScreen();
    }

    return MaterialPageRoute(builder: (context) => screenWidget);
  }
}
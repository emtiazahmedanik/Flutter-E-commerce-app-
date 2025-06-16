import 'package:craft_bay/features/auth/ui/screens/login_screen.dart';
import 'package:craft_bay/features/auth/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes{
  static Route<dynamic> getRoutes(RouteSettings settings){
    late final Widget screenWidget;
    if(settings.name == SplashScreen.name){
      screenWidget = SplashScreen();
    }else if(settings.name == LoginScreen.name){
      screenWidget = LoginScreen();
    }

    return MaterialPageRoute(builder: (context) => screenWidget);
  }
}
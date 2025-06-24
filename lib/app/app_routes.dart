import 'package:craft_bay/features/auth/ui/screens/login_screen.dart';
import 'package:craft_bay/features/auth/ui/screens/signup_screen.dart';
import 'package:craft_bay/features/auth/ui/screens/splash_screen.dart';
import 'package:craft_bay/features/auth/ui/screens/verification_screen.dart';
import 'package:craft_bay/features/common/screen/main_bottom_nav_screen.dart';
import 'package:craft_bay/features/home/ui/screen/home_screen.dart';
import 'package:craft_bay/features/product/ui/screen/product_category_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes{
  static Route<dynamic> getRoutes(RouteSettings settings){
    late final Widget screenWidget;
    if(settings.name == SplashScreen.name){
      screenWidget = SplashScreen();
    }else if(settings.name == LoginScreen.name){
      screenWidget = LoginScreen();
    }else if(settings.name == SignUpScreen.name){
      screenWidget = SignUpScreen();
    }else if(settings.name == HomeScreen.name){
      screenWidget = HomeScreen();
    }else if(settings.name == ProductCategoryScreen.name){
      screenWidget = ProductCategoryScreen();
    }else if(settings.name == MainBottomNavScreen.name){
      screenWidget = MainBottomNavScreen();
    }else if(settings.name == VerificationScreen.name){
      screenWidget = VerificationScreen();
    }

    return MaterialPageRoute(builder: (context) => screenWidget);
  }
}
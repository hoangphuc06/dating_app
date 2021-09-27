import 'package:delivery_app/src/pages/login_page.dart';
import 'package:delivery_app/src/pages/onboarding/on_boarding_page.dart';
import 'package:delivery_app/src/pages/splash_page.dart';
import 'package:flutter/material.dart';

final routes = <String,WidgetBuilder> {
  "splash_page" :(BuildContext context) => SplashPage(),
  "on_boarding_page" :(BuildContext context) => OnBoardingPage(),
  "login_page" :(BuildContext context) => LoginPage(),
};
import 'package:delivery_app/routes.dart';
import 'package:delivery_app/src/colors/colors.dart';
import 'package:delivery_app/src/pages/splash_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      initialRoute: "splash_page",
    );
  }
}
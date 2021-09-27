import 'dart:async';

import 'package:delivery_app/src/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../size_config.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), (){
      Navigator.pushNamed(context, "on_boarding_page");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
                'assets/images/logo.png',
              fit: BoxFit.contain,
            ),
            SizedBox(height: 20,),
            Text(
              'INMA',
              style: TextStyle(
                  fontFamily: 'Klasik',
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  //color: Color.fromRGBO(242, 113, 33, 1)
                color: PrimaryColor
              ),
            )
          ],
        ),
      ),
    );
  }
}

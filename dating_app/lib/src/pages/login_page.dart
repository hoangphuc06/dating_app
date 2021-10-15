import 'package:delivery_app/src/colors/colors.dart';
import 'package:delivery_app/src/widgets/main_button.dart';
import 'package:delivery_app/src/widgets/textfields/email_textfield.dart';
import 'package:delivery_app/src/widgets/textfields/password_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../size_config.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    double sizeH = SizeConfig.blockSizeH!;
    double sizeV = SizeConfig.blockSizeV!;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child:SizedBox(
          width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: sizeV * 25,
                      width: sizeH * 25,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Text(
                    'Welcome Back',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: sizeH * 7
                    ),
                  ),
                  Text(
                    "Sign in with your email and password  \nor continue with social media",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: sizeV * 3,),
                  EmailTextField(),
                  SizedBox(height: sizeV * 1.5,),
                  PasswordTextField(),
                  SizedBox(height: sizeV * 1.5,),
                  MainButton(
                      name: 'Sign in',
                      onPressed: () {
                          Navigator.pushNamed(context, "main_page");
                      }
                  ),
                  SizedBox(height: sizeV * 2,),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "forgot_password");
                    },
                    child: Text(
                      'Forgot your password?',
                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                    ),
                  ),
                  SizedBox(height: sizeV * 3,),
                  Text(
                    'Or',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: sizeV * 2,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocalCard(
                          image: "assets/icons/google-icon.svg",
                          onpressed: () {}
                      ),
                      SocalCard(
                          image: "assets/icons/facebook-2.svg",
                          onpressed: () {}
                      ),
                      SocalCard(
                          image: "assets/icons/twitter.svg",
                          onpressed: () {}
                      ),
                    ],
                  ),
                  SizedBox(height: sizeV * 3,),
                  Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 15.0),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, "sign_up");
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 2.0),
                              child: Text(
                                'Sign up',
                                style: TextStyle(color: PrimaryColor, fontWeight: FontWeight.w500, fontSize: 15.0),
                              ),
                            ),
                          ),
                        ],
                      )
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}

class SocalCard extends StatelessWidget {
  const SocalCard({
    Key? key,
    required this.image,
    required this.onpressed
  }) : super(key: key);

  final String image;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              color: Color(0xFFF5F6F9),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(image),
          ),
        ),
      ),
    );
  }
}


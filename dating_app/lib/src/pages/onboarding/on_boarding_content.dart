import 'package:delivery_app/src/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../size_config.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    Key? key,
    this.title,
    this.description,
    this.image,
  }) : super(key: key);
  final title, description, image;

  @override
  Widget build(BuildContext context) {
    double sizeH = SizeConfig.blockSizeH!;
    double sizeV = SizeConfig.blockSizeV!;
    return Column(
      children: <Widget>[
        Container(
          height: sizeV * 50,
          child: SvgPicture.asset(
            image,
            height: sizeV * 25,
            width: sizeH * 25,
            fit: BoxFit.contain,
          ),
        ),

        Text(
          title,
          style: TextStyle(
            fontFamily: 'Klasik',
            color:  PrimaryColor,
            fontSize: SizeConfig.blockSizeH! * 7,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: sizeV * 5,),
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: SizeConfig.blockSizeH! * 4.5,
            //fontWeight: FontWeight.bold
          ),
        ),
      ],
    );
  }
}

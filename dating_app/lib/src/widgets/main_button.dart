import 'package:delivery_app/src/colors/colors.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    Key? key,
    required this.name,
    required this.onPressed,
  }) : super(key: key);

  final String name;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: SizeConfig.blockSizeH! * 15,
        width: double.infinity,
        child: RaisedButton(
          child: Text(name, style: TextStyle(color: Colors.white, fontSize: 17.0),),
          onPressed: onPressed,
          color: PrimaryColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0)
          ),
        ),
      ),
    );
  }
}

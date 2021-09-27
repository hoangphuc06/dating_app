import 'package:flutter/material.dart';

import '../../../size_config.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        height: SizeConfig.blockSizeH! * 15,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Color.fromRGBO(142, 142, 147, 1.2),
            borderRadius: BorderRadius.circular(30.0)
        ),
        child: TextField(
          obscureText: true,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              hintText: 'Password',
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
              )
          ),
        ),
      ),
    );
  }
}
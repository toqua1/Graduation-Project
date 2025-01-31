import 'package:flutter/material.dart';
import 'package:graduation_project/core/constants.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xff14919B), Colors.limeAccent]),
        ),
        child: Center(
          child: Text(
            'Login',
            style: AppFonts.loginTextButton,
          ),
        ),
      ),
    );
  }
}

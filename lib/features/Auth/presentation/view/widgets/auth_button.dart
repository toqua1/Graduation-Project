import 'package:flutter/material.dart';
import 'package:graduation_project/core/Services/is_tablet.dart';
import 'package:graduation_project/core/constants.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.height,
    required this.text,
  });
  final double height;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: height * 0.07,
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
            text,
            style: AppFonts.loginTextButton.copyWith(
              fontSize: isTablet(context) ? height * 0.025 : null,
            ),
          ),
        ),
      ),
    );
  }
}

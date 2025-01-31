import 'package:flutter/material.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/features/Auth/presentation/view/widgets/custom_textfild_auth.dart';

class AuthHeaderTextField extends StatelessWidget {
  const AuthHeaderTextField({
    super.key,
    required this.height,
    required this.header,
    required this.hint,
    required this.icon,
    this.obscureText = false,
  });

  final double height;
  final String header;
  final String hint;
  final IconData icon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: AppFonts.textFieldTitle,
        ),
        SizedBox(
          height: height * 0.01,
        ),
        CustomTextField(
          hintText: hint,
          icon: icon,
          obscureText: obscureText,
        ),
      ],
    );
  }
}

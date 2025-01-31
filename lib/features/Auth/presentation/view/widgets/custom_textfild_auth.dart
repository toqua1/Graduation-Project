import 'package:flutter/material.dart';
import 'package:graduation_project/core/Services/is_tablet.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:iconsax/iconsax.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final double height;
  // final TextEditingController controller;
  final IconData? icon;
  final bool obscureText;
  final String? Function(String?)? validator;
  final void Function(String)? onChangedCallback;

  const CustomTextField({
    super.key,
    required this.hintText,
    // required this.controller,
    this.icon,
    this.obscureText = false,
    this.validator,
    this.onChangedCallback,
    required this.height,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChangedCallback,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      // controller: widget.controller,
      obscureText: widget.obscureText && _obscureText,
      validator: widget.validator,
      decoration: InputDecoration(
        hintText: widget.hintText,
        fillColor: AppColors.textFieldFillColor,
        filled: true,
        hintStyle: AppFonts.textFieldHint.copyWith(
          fontSize: isTablet(context) ? widget.height * 0.015 : null,
        ),
        prefixIcon: widget.icon != null ? Icon(widget.icon) : null,
        prefixIconColor: Colors.grey,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none),
        suffixIcon: widget.obscureText
            ? IconButton(
                icon: Icon(
                  _obscureText ? Iconsax.eye_slash5 : Iconsax.eye4,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
      ),
    );
  }
}

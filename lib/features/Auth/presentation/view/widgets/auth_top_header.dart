import 'package:flutter/material.dart';
import 'package:graduation_project/core/constants.dart';

class AuthTopHeader extends StatelessWidget {
  const AuthTopHeader({
    super.key,
    required this.first,
    required this.second,
  });
  final String first;
  final String second;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            first,
            style: AppFonts.bodyTextRegularBlack,
          ),
          Text(
            second,
            style: AppFonts.boldTextColor,
          )
        ],
      ),
    );
  }
}

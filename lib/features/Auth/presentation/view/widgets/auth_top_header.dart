import 'package:flutter/material.dart';
import 'package:graduation_project/core/Services/is_tablet.dart';
import 'package:graduation_project/core/constants.dart';

class AuthTopHeader extends StatelessWidget {
  const AuthTopHeader({
    super.key,
    required this.first,
    required this.second,
    required this.height,
  });
  final String first;
  final String second;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            first,
            style: AppFonts.bodyTextRegularBlack
                .copyWith(fontSize: isTablet(context) ? height * 0.03 : null),
          ),
          Text(
            second,
            style: AppFonts.boldTextColor
                .copyWith(fontSize: isTablet(context) ? height * 0.03 : null),
          )
        ],
      ),
    );
  }
}

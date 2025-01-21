import 'dart:math';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '../../../../../core/constants.dart';

class SectionAndTitle extends StatelessWidget {
  final String title;

  const SectionAndTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppFonts.headline2),
        Row(
          children: [
            TextButton(
              onPressed: () {},
              child: Text("See All", style: AppFonts.bodyTextLight1),
            ),
            Transform.rotate(
              angle: pi / 2,
              child: Icon(
                Icons.arrow_drop_up,
                color: AppColors.primaryColor,
                size: 30,
              ),
            )
          ],
        ),
      ],
    );
  }
}

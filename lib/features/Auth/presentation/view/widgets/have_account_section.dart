import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:graduation_project/core/Services/is_tablet.dart';
import 'package:graduation_project/core/constants.dart';

class HaveAccountSection extends StatelessWidget {
  const HaveAccountSection({
    super.key,
    required this.height,
  });
  final double height;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {},
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: 'Don’t have an account yet? ',
                    style: AppFonts.bodyTextRegularBlack.copyWith(
                        fontSize: isTablet(context) ? height * 0.02 : null)),
                TextSpan(
                    text: 'Register',
                    style: AppFonts.bodyTextRegularBlack.copyWith(
                        fontSize: isTablet(context) ? height * 0.02 : null,
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.w900)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

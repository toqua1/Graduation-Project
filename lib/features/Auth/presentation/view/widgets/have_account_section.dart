import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:graduation_project/core/Services/is_tablet.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/features/Auth/presentation/view/sign_up_screen.dart';

class HaveAccountSection extends StatelessWidget {
  const HaveAccountSection({
    super.key,
    required this.height,
    required this.txt1,
    required this.txt2,
    this.method,
  });
  final double height;
  final String txt1;
  final String txt2;
  final void Function()? method;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: method,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: txt1,
                    style: AppFonts.bodyTextRegularBlack.copyWith(
                        fontSize: isTablet(context) ? height * 0.02 : null)),
                TextSpan(
                    text: txt2,
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

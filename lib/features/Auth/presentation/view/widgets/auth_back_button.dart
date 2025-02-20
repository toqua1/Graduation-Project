import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:graduation_project/core/Services/is_tablet.dart';
import 'package:graduation_project/core/constants.dart';

class AuthBackButton extends StatelessWidget {
  const AuthBackButton({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Row(
        children: [
          Icon(
            Icons.arrow_back_ios_new_rounded,
            size: height * 0.025,
            color: NeumorphicTheme.defaultTextColor(context),
          ),
          SizedBox(
            width: width * 0.03,
          ),
          Text(
            'Back',
            style: AppFonts.bodyTextRegularBlack
                .copyWith(fontSize: isTablet(context) ? height * 0.025 : null),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:graduation_project/core/Services/is_tablet.dart';
import 'package:graduation_project/core/constants.dart';

class ForgetPass extends StatelessWidget {
  const ForgetPass({
    super.key,
    required this.height,
  });
  final double height;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        Text(
          'Forgot your password?',
          style: AppFonts.textFieldForgetPass.copyWith(
              fontSize: isTablet(context) ? height * 0.015 : null,
              decoration: TextDecoration.underline,
              decorationColor: Colors.grey.shade500),
        )
      ],
    );
  }
}

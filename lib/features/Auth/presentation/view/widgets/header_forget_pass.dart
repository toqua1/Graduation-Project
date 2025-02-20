import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:graduation_project/core/Services/is_tablet.dart';
import 'package:graduation_project/core/constants.dart';

class HeaderForgetPass extends StatelessWidget {
  const HeaderForgetPass({
    super.key,
    required this.height,
    required this.txt1,
    required this.txt2,
  });

  final double height;
  final String txt1;
  final String txt2;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          txt1,
          style: AppFonts.boldTextForgetColor.copyWith(
            fontSize: isTablet(context) ? height * 0.033 : null,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          txt2,
          style: AppFonts.bodyTextLight1
              .copyWith(fontSize: isTablet(context) ? height * 0.02 : null),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

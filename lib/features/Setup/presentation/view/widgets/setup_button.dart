import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:graduation_project/core/Services/is_tablet.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/features/Setup/presentation/view/gender_screen.dart';

class SetupButton extends StatelessWidget {
  const SetupButton({
    super.key,
    required this.size,
    required this.text,
    required this.method,
  });

  final Size size;
  final String text;
  final VoidCallback method;

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      padding: EdgeInsets.symmetric(
          horizontal: isTablet(context) ? 120 : 80,
          vertical: isTablet(context) ? 20 : 10),
      style: NeumorphicStyle(
          depth: 5,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(100))),
      onPressed: method,
      child: Text(
        text,
        style: AppFonts.setupButtonBlack
            .copyWith(fontSize: isTablet(context) ? size.height * 0.035 : null),
      ),
    );
  }
}

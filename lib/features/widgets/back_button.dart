import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:graduation_project/core/constants.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      style: NeumorphicStyle(
        depth: -4,
        intensity: 0.8,
        shape: NeumorphicShape.flat,
        color: Colors.white,
        boxShape: NeumorphicBoxShape.roundRect(
          BorderRadius.circular(8),
        ),
      ),
      padding: const EdgeInsets.all(10.0), // Button padding
      child: const Icon(Icons.arrow_back_ios_new_rounded,
          color: AppColors.primaryColor),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:graduation_project/core/constants.dart';

class NeumorphicAddButton extends StatelessWidget {
  const NeumorphicAddButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      style: NeumorphicStyle(
        depth: 4,
        intensity: 0.8,
        color: NeumorphicTheme.baseColor(context),
        boxShape: NeumorphicBoxShape.circle(),
      ),
      padding: const EdgeInsets.all(15),
      child: const Icon(Icons.done_rounded,
          color: AppColors.primaryColor, size: 28),
      onPressed: () {
        Navigator.pop(context); // Close Bottom Sheet
      },
    );
  }
}

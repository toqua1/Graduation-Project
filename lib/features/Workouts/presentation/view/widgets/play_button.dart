import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:graduation_project/core/constants.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      padding:
          EdgeInsets.zero, // Ensure it does not interfere with the container
      onPressed: () {},
      style: NeumorphicStyle(depth: 0, boxShape: NeumorphicBoxShape.circle()),
      child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.primaryColor,
                AppColors.secondaryColor,
              ],
            ),
          ),
          child: Center(
            child: Icon(
              Icons.play_arrow_rounded,
              color: NeumorphicTheme.baseColor(context),
            ),
          )),
    );
  }
}

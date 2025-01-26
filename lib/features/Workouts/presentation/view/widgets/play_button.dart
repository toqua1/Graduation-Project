import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:graduation_project/core/constants.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      padding: EdgeInsets.zero,
      onPressed: () {},
      style: NeumorphicStyle(depth: 4, boxShape: NeumorphicBoxShape.circle()),
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
                stops: [
                  0.1,
                  0.9
                ]),
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

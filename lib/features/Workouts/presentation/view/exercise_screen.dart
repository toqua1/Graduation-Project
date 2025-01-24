import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExerciseScreen extends StatelessWidget {
  const ExerciseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeumorphicTheme.baseColor(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Back Button
              NeumorphicButton(
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
                  // Action for back button
                },
              ),

              // Title Text
              Text('Arm Exercise', style: AppFonts.headline1),

              // More Options Button
              NeumorphicButton(
                style: NeumorphicStyle(
                  depth: -4,
                  intensity: 0.8,
                  shape: NeumorphicShape.flat,
                  color: Colors.white,
                  boxShape: NeumorphicBoxShape.roundRect(
                    BorderRadius.circular(8),
                  ),
                ),
                padding: const EdgeInsets.all(15), // Button padding
                child: SvgPicture.asset(
                  'lib/assets/Vector.svg',
                  height: 12,
                  width: 12,
                ),
                onPressed: () {
                  // Action for back button
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:ui';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/features/Workouts/presentation/view/exercise_screen.dart';

class WorkoutCard extends StatelessWidget {
  const WorkoutCard({super.key});

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ExerciseScreen()));
      },
      style: NeumorphicStyle(
        depth: -4,
        intensity: 4,
        shape: NeumorphicShape.flat,
        color: NeumorphicTheme.baseColor(context),
        boxShape: NeumorphicBoxShape.roundRect(
          BorderRadius.circular(16),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/assets/arm2.png',
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
            // const SizedBox(height: 8),
            Text(
              'Arm Exercises',
              style: AppFonts.headlineTextBlack,
            ),
          ],
        ),
      ),
    );
  }
}

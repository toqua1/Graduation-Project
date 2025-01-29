import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/features/Workouts/presentation/view/widgets/exercise_info_card.dart';
import 'package:graduation_project/features/widgets/back_button.dart';

class ExerciseItemScreen extends StatelessWidget {
  const ExerciseItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  bottom: size.height * 0.60,
                  child: SvgPicture.asset('lib/assets/warmUp.svg',
                      fit: BoxFit.cover),
                ),
                Positioned(left: 20, top: 40, child: CustomBackButton()),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: ExerciseInfoCard(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

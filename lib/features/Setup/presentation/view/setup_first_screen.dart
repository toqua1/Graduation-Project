import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/Services/is_tablet.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/features/Setup/presentation/view/gender_screen.dart';

class SetUpScreen extends StatelessWidget {
  const SetUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'lib/assets/setup.svg',
                  fit: BoxFit.cover,
                  width: size.width * 0.5,
                  height: size.height * 0.4,
                ),
                Text(
                  'Your Fitness Journey Starts Here!',
                  style: AppFonts.setupBlack,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Text(
                  'Complete your profile to unlock a custom workout plan & rewards!',
                  style: AppFonts.tabTextInactive,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: isTablet(context) ? 150 : 90),
                NeumorphicButton(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  style: NeumorphicStyle(
                      depth: 5,
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(100))),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GenderScreen()),
                    );
                  },
                  child: Text(
                    'Next',
                    style: AppFonts.setupButtonBlack,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

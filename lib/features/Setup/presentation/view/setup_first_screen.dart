import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/Services/is_tablet.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/features/Setup/presentation/view/gender_screen.dart';

import 'widgets/setup_button.dart';

class SetUpScreen extends StatelessWidget {
  const SetUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: NeumorphicTheme.baseColor(context),
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
                  style: AppFonts.setupBlack.copyWith(
                      fontSize: isTablet(context) ? size.height * 0.045 : null),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: isTablet(context) ? 40 : 20),
                Text(
                  'Complete your profile to unlock a custom workout plan & rewards!',
                  style: AppFonts.tabTextInactive.copyWith(
                      fontSize: isTablet(context) ? size.height * 0.015 : null),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: isTablet(context) ? 150 : 90),
                SetupButton(
                  size: size,
                  text: 'Next',
                  method: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GenderSelectionScreen())),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

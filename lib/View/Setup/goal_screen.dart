import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:graduation_project/Controllers/setup_controller.dart';
import 'package:graduation_project/View/Setup/activity_level_screen.dart';
import 'package:graduation_project/View/Setup/widgets/app_bar.dart';
import 'package:graduation_project/View/Setup/widgets/setup_button.dart';
import 'package:graduation_project/core/Services/is_tablet.dart';
import 'package:graduation_project/core/constants.dart';

class GoalScreen extends StatelessWidget {
  GoalScreen({super.key});
  SetUpController controller =Get.find();

  final List<String> goals = [
    "Lose Weight",
    "Build Muscle",
    "Maintain Fitness",
    "Others",
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: NeumorphicTheme.baseColor(context),
      appBar: SetUpAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: isTablet(context) ? 40 : 20),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: isTablet(context)? 80:60,),
            Text(
              "What Is Your Goal?",
              style: AppFonts.setupHeader.copyWith(
                  fontSize: isTablet(context) ? screenHeight * 0.037 : null),
            ),
            SizedBox(height: isTablet(context) ? 60 : 40),
            // Goal Selection ListView inside Obx
            // ListView for goal selection
            Expanded(
              child: ListView.builder(
                itemCount: goals.length,
                itemBuilder: (context, index) {
                  String goal = goals[index];
                  return Column(
                    children: [
                      ListTile(
                        title: Text(goal, style: AppFonts.radioTitle),

                        // Wrap only the Radio button inside Obx to make it reactive
                        trailing: Obx(() => Transform.scale(
                          scale: isTablet(context) ? 2 : 1.5,
                          child: Radio<String>(
                            value: goal,
                            groupValue: controller.selectedGoal.value,
                            onChanged: (value) {
                              controller.selectGoal(value!);
                            },
                            activeColor: AppColors.primaryColor,

                          ),
                        )),
                      ),
                      SizedBox(height: isTablet(context) ? 40 : 20),
                    ],
                  );
                },
              ),
            ),

            SizedBox(height: isTablet(context) ? 50 : 30),
            SetupButton(
              text: 'Continue',
              size: size,
              method: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ActivityLevelScreen()),
              ),
            ),
            SizedBox(height: isTablet(context) ? 50 : 30),

          ],
        ),
      ),
    );
  }
}

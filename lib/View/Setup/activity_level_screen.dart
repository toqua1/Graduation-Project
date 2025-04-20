import 'dart:developer';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:graduation_project/Controllers/create_account_controller.dart';
import 'package:graduation_project/Controllers/setup_controller.dart';
import 'package:graduation_project/View/Setup/weight_screen.dart';
import 'package:graduation_project/View/Setup/widgets/activity_level_button.dart';
import 'package:graduation_project/View/Setup/widgets/app_bar.dart';
import 'package:graduation_project/View/Setup/widgets/setup_button.dart';
import 'package:graduation_project/core/Services/is_tablet.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:page_transition/page_transition.dart';

import '../../core/Services/alert_dialog.dart';
import '../../core/Services/navigation_service.dart';
import '../Auth/login_screen.dart';

class ActivityLevelScreen extends StatefulWidget {
  const ActivityLevelScreen({super.key});

  @override
  _ActivityLevelScreenState createState() => _ActivityLevelScreenState();
}

class _ActivityLevelScreenState extends State<ActivityLevelScreen> {
  SetUpController controller = Get.find();
  SignUpController signUpController = Get.find();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: NeumorphicTheme.baseColor(context),
      appBar: SetUpAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: isTablet(context) ? 40 : 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Physical Activity Level?",
                style: AppFonts.setupHeader.copyWith(
                    fontSize: isTablet(context) ? screenHeight * 0.037 : null),
              ),
              SizedBox(height: isTablet(context) ? 50 : 30),
              Column(
                children: [
                  ActivityLevelButton(
                    title: 'Beginner',
                    selectedLevel: controller.selectedLevel,
                    onTap: () => controller.setLevel('Beginner'),
                  ),
                  SizedBox(height: size.height * 0.05),
                  ActivityLevelButton(
                    title: 'Intermediate',
                    selectedLevel: controller.selectedLevel,
                    onTap: () => controller.setLevel('Intermediate'),
                  ),
                  SizedBox(height: size.height * 0.05),
                  ActivityLevelButton(
                    title: 'Advanced',
                    selectedLevel: controller.selectedLevel,
                    onTap: () => controller.setLevel('Advanced'),
                  ),
                ],
              ),
              SizedBox(height: isTablet(context) ? 50 : 30),
              SetupButton(
                  text: 'Create Account',
                  size: size,
                  method: () async {
                    await signUpController.signUpUser();

                    if (signUpController.signUpSuccess.value) {
                      CustomDialog.show(
                          context: context,
                          title: 'Success',
                          content: 'Sign up successful!',
                          onConfirm: () => NavigationService().goBack(),
                          goal: 'success',
                          method: context.pushAndRemoveUntilTransition(
                            type: PageTransitionType.fade,
                            child: LoginScreen(),
                            predicate: (route) => false,
                          ));
                      goal:
                      'success';
                    } else if (signUpController.errorMessage.isNotEmpty) {
                      log(signUpController.errorMessage.value);
                      CustomDialog.show(
                          context: context,
                          title: 'Error',
                          content: signUpController.errorMessage.value,
                          onConfirm: () => NavigationService().goBack(),
                          goal: 'error');
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

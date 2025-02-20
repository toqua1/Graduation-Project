import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:graduation_project/core/Services/is_tablet.dart';
import 'package:graduation_project/core/Services/responsive_function.dart';
import 'package:graduation_project/features/Auth/presentation/view/login_screen.dart';
import 'package:graduation_project/features/Auth/presentation/view/widgets/auth_back_button.dart';
import 'package:graduation_project/features/Auth/presentation/view/widgets/auth_button.dart';
import 'package:graduation_project/features/Auth/presentation/view/widgets/auth_header_textfield.dart';
import 'package:graduation_project/features/Auth/presentation/view/widgets/header_forget_pass.dart';
import 'package:graduation_project/features/Auth/presentation/view/widgets/successful_new_pass.dart';

class CreateNewPassScreen extends StatelessWidget {
  const CreateNewPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // Hide keyboard when tapping outside
      },
      child: Scaffold(
        backgroundColor: NeumorphicTheme.baseColor(context),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
                padding: EdgeInsets.all(responsiveSize(context, 30, 70)),
                child: Column(children: [
                  AuthBackButton(height: height, width: width),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  HeaderForgetPass(
                    height: height,
                    txt1: 'Create a New Password',
                    txt2: '',
                  ),
                  SizedBox(
                    height: height * 0.07,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: isTablet(context) ? width * 0.07 : 0),
                    child: Column(
                      children: [
                        AuthHeaderTextField(
                          height: height,
                          header: 'Password',
                          hint: 'Enter Password',
                          icon: Icons.lock_outline_rounded,
                          obscureText: true,
                        ),
                        SizedBox(
                          height: height * 0.035,
                        ),
                        AuthHeaderTextField(
                          height: height,
                          header: 'Confirm Password',
                          hint: 'Enter Password',
                          icon: Icons.lock_outline_rounded,
                          obscureText: true,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.2,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: isTablet(context) ? width * 0.1 : 0),
                    child: AuthButton(
                        height: height,
                        text: 'Verify',
                        method: () => _showSuccessDialog(context)),
                  )
                ])),
          ),
        ),
      ),
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: '',
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (context, animation1, animation2) {
        return Dialog(
          backgroundColor: NeumorphicTheme.baseColor(context),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(70),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: const SuccessfulNewPass(),
          ),
        );
      },
      transitionBuilder: (context, animation1, animation2, child) {
        final curvedAnimation = CurvedAnimation(
          parent: animation1,
          curve: Curves.easeInOut,
        );
        return ScaleTransition(
          scale: curvedAnimation,
          child: child,
        );
      },
    );

    // Delay for 2 seconds, then navigate to login screen
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pop(); // Close dialog
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
          (route) => false);
    });
  }
}

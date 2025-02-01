import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:graduation_project/core/Services/is_tablet.dart';
import 'package:graduation_project/core/Services/responsive_function.dart';
import 'package:graduation_project/features/Auth/presentation/view/otp_screen.dart';
import 'package:graduation_project/features/Auth/presentation/view/widgets/auth_back_button.dart';
import 'package:graduation_project/features/Auth/presentation/view/widgets/auth_button.dart';
import 'package:graduation_project/features/Auth/presentation/view/widgets/auth_header_textfield.dart';
import 'package:graduation_project/features/Auth/presentation/view/widgets/header_forget_pass.dart';

class ForgetPassScreen extends StatelessWidget {
  const ForgetPassScreen({super.key});

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
                    height: height * 0.13,
                  ),
                  HeaderForgetPass(
                    height: height,
                    txt1: 'Forgot Password?',
                    txt2:
                        'Don’t worry! It happens. Please enter the address associated with your account.',
                  ),
                  SizedBox(
                    height: height * 0.13,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: isTablet(context) ? width * 0.05 : 0),
                    child: AuthHeaderTextField(
                        height: height,
                        header: 'Email',
                        hint: 'Enter your email',
                        icon: Icons.email_outlined),
                  ),
                  SizedBox(
                    height: height * 0.07,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: isTablet(context) ? width * 0.1 : 0),
                    child: AuthButton(
                      height: height,
                      text: 'Send',
                      method: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => OtpScreen())),
                    ),
                  )
                ])),
          ),
        ),
      ),
    );
  }
}

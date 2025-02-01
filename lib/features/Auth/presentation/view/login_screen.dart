import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:graduation_project/core/Services/is_tablet.dart';
import 'package:graduation_project/core/Services/responsive_function.dart';
import 'package:graduation_project/features/Auth/presentation/view/sign_up_screen.dart';
import 'package:graduation_project/features/Auth/presentation/view/widgets/auth_button.dart';
import 'package:graduation_project/features/Auth/presentation/view/widgets/auth_header_textfield.dart';
import 'package:graduation_project/features/Auth/presentation/view/widgets/auth_top_header.dart';
import 'package:graduation_project/features/Auth/presentation/view/widgets/forget_pass_row.dart';
import 'package:graduation_project/features/Auth/presentation/view/widgets/have_account_section.dart';
import 'package:graduation_project/features/Auth/presentation/view/widgets/or_divider.dart';
import 'package:graduation_project/features/Auth/presentation/view/widgets/social_icons_row.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
            child: Column(
              children: [
                AuthTopHeader(
                  first: 'Hey There,',
                  second: 'Welcome Back ',
                  height: height,
                ),
                SizedBox(
                  height: height * 0.1,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: isTablet(context) ? width * 0.07 : 0),
                  child: Column(
                    children: [
                      AuthHeaderTextField(
                        height: height,
                        header: 'Email',
                        hint: 'Enter your email',
                        icon: Icons.email_outlined,
                      ),
                      SizedBox(
                        height: height * 0.04,
                      ),
                      AuthHeaderTextField(
                        height: height,
                        header: 'Password',
                        hint: 'Enter Password',
                        icon: Icons.lock_outline_rounded,
                        obscureText: true,
                      ),
                      SizedBox(
                        height: height * 0.0009,
                      ),
                      ForgetPass(
                        height: height,
                      ),
                      SizedBox(
                        height: height * 0.1,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: isTablet(context) ? width * 0.1 : 0),
                  child: AuthButton(
                    height: height,
                    text: 'Login',
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                OrDivider(),
                SizedBox(
                  height: height * 0.03,
                ),
                SocialIconsRow(width: width),
                SizedBox(
                  height: height * 0.03,
                ),
                HaveAccountSection(
                  txt1: 'Don’t have an account yet? ',
                  txt2: 'Register',
                  height: height,
                  method: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpScreen())),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}

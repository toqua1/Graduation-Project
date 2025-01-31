import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/features/Auth/presentation/view/widgets/auth_button.dart';
import 'package:graduation_project/features/Auth/presentation/view/widgets/auth_header_textfield.dart';
import 'package:graduation_project/features/Auth/presentation/view/widgets/auth_top_header.dart';

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
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
                AuthTopHeader(first: 'Hey There,', second: 'Welcome Back '),
                SizedBox(
                  height: height * 0.1,
                ),
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
                  height: height * 0.01,
                ),
                ForgetPass(),
                SizedBox(
                  height: height * 0.1,
                ),
                AuthButton(),
                SizedBox(
                  height: height * 0.03,
                ),
                OrDivider(),
                SizedBox(
                  height: height * 0.03,
                ),
                SocialIcons(),
                SizedBox(
                  height: height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: 'Don’t have an account yet? ',
                                style: AppFonts.bodyTextRegularBlack),
                            TextSpan(
                                text: 'Register',
                                style: AppFonts.bodyTextRegularBlack.copyWith(
                                    color: AppColors.secondaryColor,
                                    fontWeight: FontWeight.w900)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}

class SocialIcons extends StatelessWidget {
  const SocialIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        NeumorphicButton(
          style: NeumorphicStyle(
              depth: 5,
              boxShape:
                  NeumorphicBoxShape.roundRect(BorderRadius.circular(16))),
          child: Image.asset('lib/assets/google2.png'),
        )
      ],
    );
  }
}

class OrDivider extends StatelessWidget {
  const OrDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: Colors.grey.shade400,
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Or',
            style: AppFonts.loginOrText,
          ),
        ),
        Expanded(
          child: Divider(
            color: Colors.grey.shade400,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}

class ForgetPass extends StatelessWidget {
  const ForgetPass({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        Text(
          'Forgot your password?',
          style: AppFonts.textFieldForgetPass.copyWith(
              decoration: TextDecoration.underline,
              decorationColor: Colors.grey.shade500),
        )
      ],
    );
  }
}

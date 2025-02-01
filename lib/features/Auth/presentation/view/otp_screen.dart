import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:graduation_project/core/Services/is_tablet.dart';
import 'package:graduation_project/core/Services/responsive_function.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/features/Auth/presentation/view/widgets/auth_back_button.dart';
import 'package:graduation_project/features/Auth/presentation/view/widgets/auth_button.dart';
import 'package:graduation_project/features/Auth/presentation/view/widgets/have_account_section.dart';
import 'package:graduation_project/features/Auth/presentation/view/widgets/header_forget_pass.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

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
                    txt1: 'Verify',
                    txt2: 'Please enter the code we sent you to email',
                  ),
                  SizedBox(
                    height: height * 0.13,
                  ),
                  OtpTextField(
                    numberOfFields: 4,
                    borderColor: AppColors.secondaryColor,
                    focusedBorderColor: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(10),
                    borderWidth: 3,
                    fieldHeight: responsiveSize(context, 60, 60),
                    fieldWidth: responsiveSize(context, 50, 130),
                    textStyle: AppFonts.boldTextColor,
                    //set to true to show as box or false to show as dash
                    showFieldAsBox: true,
                    //runs when a code is typed in
                    onCodeChanged: (String code) {
                      //handle validation or checks here
                    },
                    //runs when every textfield is filled
                    onSubmit: (String verificationCode) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Verification Code"),
                              content:
                                  Text('Code entered is $verificationCode'),
                            );
                          });
                    }, // end onSubmit
                  ),
                  SizedBox(
                    height: height * 0.07,
                  ),
                  HaveAccountSection(
                      height: height,
                      txt1: 'Didn’t receive the code?',
                      txt2: ' Resend'),
                  SizedBox(
                    height: height * 0.07,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: isTablet(context) ? width * 0.1 : 0),
                    child: AuthButton(
                      height: height,
                      text: 'Verify',
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

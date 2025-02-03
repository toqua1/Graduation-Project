import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SuccessfulNewPass extends StatelessWidget {
  const SuccessfulNewPass({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => _buildContent(context, isTablet: false),
      tablet: (context) => _buildContent(context, isTablet: true),
    );
  }

  Widget _buildContent(BuildContext context, {required bool isTablet}) {
    return SingleChildScrollView(
      child: Container(
        width: isTablet ? 60.sw : double.infinity,
        color: NeumorphicTheme.baseColor(context),
        padding: EdgeInsets.symmetric(
          horizontal: isTablet ? 32.0 : 16.0,
          vertical: isTablet ? 48.0 : 24.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'lib/assets/success.svg',
              width: isTablet ? 350 : 120, // Adjust size based on device
            ),
            const SizedBox(height: 16),
            Text(
              'Congratulations !',
              style: AppFonts.boldTextForgetColor.copyWith(fontSize: 5.sw),
            ),
            const SizedBox(height: 16),
            Text(
              'Password Reset successful You’ll be redirected to the login screen now',
              style: AppFonts.bodyTextRegularBlack.copyWith(fontSize: 4.sw),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: isTablet ? 100 : 50),
          ],
        ),
      ),
    );
  }
}

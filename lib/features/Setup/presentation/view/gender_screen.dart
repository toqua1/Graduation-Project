import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:graduation_project/core/Services/is_tablet.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/features/Setup/presentation/view/age_screen.dart';
import 'package:graduation_project/features/Setup/presentation/view/widgets/app_bar.dart';

class GenderSelectionScreen extends StatefulWidget {
  const GenderSelectionScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GenderSelectionScreenState createState() => _GenderSelectionScreenState();
}

class _GenderSelectionScreenState extends State<GenderSelectionScreen> {
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: NeumorphicTheme.baseColor(context),
      appBar: SetUpAppBar(), // Add the appBar property here
      body: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: isTablet(context) ? 40 : 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("What’s Your Gender?",
                    style: AppFonts.setupHeader.copyWith(
                        fontSize:
                            isTablet(context) ? screenHeight * 0.037 : null)),
                SizedBox(height: isTablet(context) ? 50 : 30),
                Column(
                  children: [
                    _genderButton(
                        "Male", Icons.male, "male", isTablet(context)),
                    SizedBox(height: isTablet(context) ? 30 : 20),
                    _genderButton(
                        "Female", Icons.female, "female", isTablet(context)),
                  ],
                ),
                SizedBox(height: isTablet(context) ? 50 : 30),
                _continueButton(isTablet(context), screenHeight),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _genderButton(
      String label, IconData icon, String gender, bool isTablet) {
    return GestureDetector(
      onTap: () => setState(() => selectedGender = gender),
      child: Container(
        width: isTablet ? 150 : 120,
        height: isTablet ? 150 : 120,
        decoration: BoxDecoration(
          color: selectedGender == gender
              ? AppColors.secondaryColor
              : Colors.white,
          shape: BoxShape.circle,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
        ),
        child: Icon(icon, size: isTablet ? 70 : 50, color: Colors.black),
      ),
    );
  }

  Widget _continueButton(bool isTablet, var height) {
    return NeumorphicButton(
      style: NeumorphicStyle(
          depth: 5,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(100))),
      onPressed: selectedGender != null
          ? () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AgeSelectionScreen()),
              );
            }
          : null,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: isTablet ? 120 : 50, vertical: isTablet ? 10 : 0),
        child: Text(
          "Continue",
          style: AppFonts.setupButtonBlack
              .copyWith(fontSize: isTablet ? height * 0.03 : null),
        ),
      ),
    );
  }
}

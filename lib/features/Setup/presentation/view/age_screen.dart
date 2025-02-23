import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:graduation_project/core/Services/is_tablet.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/features/Setup/presentation/view/weight_screen.dart';
import 'package:graduation_project/features/Setup/presentation/view/widgets/app_bar.dart';
import 'package:graduation_project/features/Setup/presentation/view/widgets/setup_button.dart';
import 'package:iconsax/iconsax.dart';

class AgeSelectionScreen extends StatefulWidget {
  const AgeSelectionScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AgeSelectionScreenState createState() => _AgeSelectionScreenState();
}

class _AgeSelectionScreenState extends State<AgeSelectionScreen> {
  int selectedAge = 10;

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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "How Old Are You?",
              style: AppFonts.setupHeader.copyWith(
                  fontSize: isTablet(context) ? screenHeight * 0.037 : null),
            ),
            SizedBox(height: isTablet(context) ? 50 : 30),
            Column(
              children: [
                Text(
                  "$selectedAge",
                  style: AppFonts.setupHeaderAge.copyWith(
                      fontSize: isTablet(context) ? screenHeight * 0.1 : null),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: size.width * 0.45,
                    ),
                    Icon(
                      Iconsax.arrow_up_15,
                      size: isTablet(context) ? 80 : 50,
                      color: AppColors.secondaryColor,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                _agePicker(isTablet(context)),
              ],
            ),
            SizedBox(height: isTablet(context) ? 50 : 30),
            SetupButton(
              text: 'Continue',
              size: size,
              method: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WeightSelectionScreen()),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _agePicker(bool isTablet) {
    return Container(
      height: isTablet ? 150 : 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 100,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => setState(() => selectedAge = index + 10),
            child: Container(
              width: isTablet ? 100 : 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: selectedAge == index + 10
                    ? AppColors.primaryColor
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Text(
                "${index + 10}",
                style: TextStyle(
                  fontSize: isTablet ? 35 : 18,
                  fontFamily: AppFonts.primaryBoldFont,
                  color:
                      selectedAge == index + 10 ? Colors.white : Colors.black,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _continueButton(bool isTablet) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        shadowColor: Colors.black26,
        elevation: 5,
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WeightSelectionScreen()),
        );
      },
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: 40, vertical: isTablet ? 20 : 15),
        child: Text("Continue",
            style:
                TextStyle(color: Colors.black, fontSize: isTablet ? 20 : 16)),
      ),
    );
  }
}

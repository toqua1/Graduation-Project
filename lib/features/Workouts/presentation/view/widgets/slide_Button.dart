import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:graduation_project/core/Services/responsive_function.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/features/Workouts/presentation/view/waiting_screen.dart';
import 'package:slider_button/slider_button.dart';

class SlideToGoButton extends StatelessWidget {
  const SlideToGoButton({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Center(
      child: Neumorphic(
        style: NeumorphicStyle(
            depth: -5,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(16))),
        child: SliderButton(
          action: () async {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => WaitingScreen()));
            return true;
          },
          alignLabel: Alignment.center,

          ///Put label over here
          label: Text("Slide to Go!", style: AppFonts.primarySemibold),
          icon: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xff14919B), Colors.limeAccent]),
            ),
            child: Center(
                child: Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColors.bottomSheetColor,
              size: 35,
            )),
          ),

          ///Change All the color and size from here.
          width: size.width * responsiveSize(context, 0.70, 0.50),
          height: responsiveSize(context, 60, 70),
          radius: 10,
          // buttonColor: AppColors.secondaryColor,
          backgroundColor: AppColors.bottomSheetColor,
          highlightedColor: Colors.white,
          baseColor: AppColors.secondaryColor,
        ),
      ),
    );
  }
}

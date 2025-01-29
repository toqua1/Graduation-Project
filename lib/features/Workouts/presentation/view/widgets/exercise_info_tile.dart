import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:graduation_project/core/Services/responsive_function.dart';
import 'package:graduation_project/core/constants.dart';

class ExerciseInfoTile extends StatelessWidget {
  final String title;
  final String value;
  const ExerciseInfoTile({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: responsiveSize(context, 170 / 130, 70 / 40),
        child: Neumorphic(
          style: NeumorphicStyle(
              depth: 5,
              color: AppColors.bottomSheetItemColor,
              boxShape:
                  NeumorphicBoxShape.roundRect(BorderRadius.circular(25))),
          padding: EdgeInsets.all(responsiveSize(context, 12, 20)),
          margin: EdgeInsets.symmetric(
              horizontal: responsiveSize(context, 0, 20), vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppFonts.primaryBodyText),
              SizedBox(height: 4),
              Text(value, style: AppFonts.bodyTextBlackThin),
            ],
          ),
        ),
      ),
    );
  }
}

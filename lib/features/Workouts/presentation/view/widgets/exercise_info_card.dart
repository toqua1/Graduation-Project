import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/Services/responsive_function.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/features/Workouts/presentation/view/widgets/exercise_info_tile.dart';
import 'package:graduation_project/features/Workouts/presentation/view/widgets/slide_Button.dart';

class ExerciseInfoCard extends StatelessWidget {
  const ExerciseInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      padding: EdgeInsets.all(responsiveSize(context, 20, 30)),
      decoration: BoxDecoration(
        color: AppColors.bottomSheetColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5),
          Text('Jumping Jack', style: AppFonts.headlineTextBlack),
          SizedBox(height: 16),
          Row(
            children: [
              Text('Easy | 390 Calories Burn ', style: AppFonts.subtitle),
              SvgPicture.asset('lib/assets/calories 1.svg')
            ],
          ),
          SizedBox(height: 20),
          Text('Descriptions', style: AppFonts.headlineTextBlack),
          SizedBox(height: 16),
          Text(
            'A jumping jack, also known as a star jump... Read More...',
            style: AppFonts.subtitle,
          ),
          SizedBox(height: 20),
          Text('Information', style: AppFonts.headlineTextBlack),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ExerciseInfoTile(
                  title: 'Repetitions Count', value: '20 repetitions'),
              SizedBox(
                width: responsiveSize(context, 15, 0),
              ),
              ExerciseInfoTile(title: 'Equipment', value: 'Skipping Rope'),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ExerciseInfoTile(
                  title: 'Target Muscles', value: 'Legs, Glutes, Core'),
              SizedBox(
                width: responsiveSize(context, 15, 0),
              ),
              ExerciseInfoTile(
                  title: 'Secondary Muscles', value: 'Arms, Shoulders'),
            ],
          ),
          SizedBox(height: size.height * responsiveSize(context, 0.05, 0.03)),
          SlideToGoButton(),
        ],
      ),
    );
  }
}

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../../core/constants.dart';

class ActivityLevelButton extends StatelessWidget {
  final String title;
  final RxString selectedLevel;
  final void Function() onTap;

  const ActivityLevelButton({
    Key? key,
    required this.title,
    required this.selectedLevel,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx((){
      final isSelected = selectedLevel == title;
      return SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.height * 0.059,
        child: NeumorphicButton(
          onPressed: onTap,
          style: NeumorphicStyle(
            color: isSelected ? AppColors.secondaryColor : NeumorphicTheme.baseColor(context),
            shape: NeumorphicShape.convex,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
          ),
          child: Center(
            child: Text(
              title,
              style: AppFonts.primarySemibold.copyWith(
                color: isSelected ? Colors.black : null,
              ),
            ),
          ),
        ),
      );
    }
    );
  }
}

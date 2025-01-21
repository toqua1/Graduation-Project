import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:graduation_project/core/constants.dart';

class NeumorphicRecoItem extends StatelessWidget {
  const NeumorphicRecoItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
        depth: 4,
        // intensity: 4,
        color: Colors.white,
        boxShape: NeumorphicBoxShape.roundRect(
          BorderRadius.circular(12),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              image: const DecorationImage(
                image: AssetImage('lib/assets/img1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text(
                  "Squat Exercise",
                  style: AppFonts.primaryTextThin,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.timer,
                          size: 14,
                          color: AppColors.secondaryColor,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "12 Minutes",
                          style: AppFonts.bodyTextExtraThinBlack,
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Icon(
                          Icons.local_fire_department,
                          size: 14,
                          color: AppColors.secondaryColor,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "120 Kcal",
                          style: AppFonts.bodyTextExtraThinBlack,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

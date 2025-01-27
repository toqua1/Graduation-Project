import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:graduation_project/core/constants.dart';

class NeumorphicTextField extends StatelessWidget {
  const NeumorphicTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Enter Collection Name",
          style: AppFonts.tabTextInactive,
        ),
        const SizedBox(height: 10),
        Neumorphic(
          style: NeumorphicStyle(
            depth: -5,
            intensity: 0.8,
            color: NeumorphicTheme.baseColor(context),
            boxShape: NeumorphicBoxShape.roundRect(
                BorderRadius.circular(20)), // Smooth edges
          ),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              suffixIcon: Container(
                margin: const EdgeInsets.only(right: 8), // Adjust spacing
                decoration: const BoxDecoration(
                  color: AppColors.secondaryColor, // Add background color
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.library_books_rounded,
                    color: NeumorphicTheme.baseColor(
                        context)), // Ensure visibility
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/features/Workouts/presentation/view/widgets/workout_card.dart';

class WorkoutsScreen extends StatelessWidget {
  const WorkoutsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft, // Start from the top left
                end: Alignment.bottomRight, // End at the bottom right
                colors: [
                  AppColors.primaryColor,
                  AppColors.secondaryColor,
                ],
              ),
            ),
            child: ClipPath(
              clipper: CurvedBackgroundClipper(),
              child: Container(
                color: NeumorphicTheme.baseColor(context),
              ),
            ),
          ),
          // Foreground content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Grid
                  Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.all(16),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 1,
                      ),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return WorkoutCard();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text('Workouts', style: AppFonts.headline1),
    );
  }
}

class CurvedBackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    // Start from top left
    // path.lineTo(0, size.height * 0.05); // Straight line to % height
    // path.quadraticBezierTo(
    //   size.width * 0.5, size.height * 0.2, // Control point
    //   size.width, size.height, // End point
    // );
    // path.lineTo(0, size.height); // Closing bottom-left
    path.lineTo(size.width * 0.95555, 0); // Line to the top-right corner
    path.lineTo(0, size.height); // Diagonal line to the bottom-left corner
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; // No need to reclip unless the design changes dynamically
  }
}

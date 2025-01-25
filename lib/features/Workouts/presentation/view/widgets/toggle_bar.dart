import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:graduation_project/core/Services/responsive_function.dart';
import 'package:graduation_project/core/constants.dart';

class ToggleBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onIndexChanged; // Callback function

  ToggleBar(
      {super.key, required this.selectedIndex, required this.onIndexChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: responsiveSize(context, 0, 25)),
      child: NeumorphicToggle(
        height: responsiveSize(context, 60, 70),
        width: double.infinity,
        selectedIndex: selectedIndex,
        style: NeumorphicToggleStyle(
          depth: -5,
          borderRadius: const BorderRadius.all(Radius.circular(25)),
        ),
        displayForegroundOnlyIfSelected: true,
        children: [
          ToggleElement(
            background: Center(child: Text('Beginner')),
            foreground: Center(
              child: Text('Beginner',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ),
          ToggleElement(
            background: Center(child: Text('Intermediate')),
            foreground: Center(
              child: Text('Intermediate',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ),
          ToggleElement(
            background: Center(child: Text('Advanced')),
            foreground: Center(
              child: Text('Advanced',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
        thumb: Neumorphic(
          margin: EdgeInsets.all(5),
          style: NeumorphicStyle(
            depth: 5,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(25)),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.primaryColor,
                  Colors.teal.shade400,
                  Colors.lime.shade400,
                  AppColors.secondaryColor,
                ],
              ),
            ),
          ),
        ),
        onChanged: onIndexChanged, // Calls the callback when tapped
      ),
    );
  }
}

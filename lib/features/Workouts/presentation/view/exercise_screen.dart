import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:graduation_project/features/Workouts/presentation/view/advanced_page.dart';
import 'package:graduation_project/features/Workouts/presentation/view/begginer_page.dart';
import 'package:graduation_project/features/Workouts/presentation/view/intermediate_page.dart';
import 'package:graduation_project/features/Workouts/presentation/view/widgets/toggle_bar.dart';
import 'package:graduation_project/features/widgets/custom_app_bar.dart';

class ExerciseScreen extends StatelessWidget {
  const ExerciseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0; // Default selected index

    return Scaffold(
      backgroundColor: NeumorphicTheme.baseColor(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            children: [
              CustomAppBar(),
              SizedBox(height: 20),
              ToggleBar(
                selectedIndex: selectedIndex,
              ),
              SizedBox(height: 20),
              // Different pages displayed based on the selected toggle
              Expanded(
                child: IndexedStack(
                  index: selectedIndex,
                  children: [
                    BegginerPage(),
                    IntermediatePage(),
                    AdvancedPage(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

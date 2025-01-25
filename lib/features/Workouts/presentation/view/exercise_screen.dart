import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:graduation_project/features/Workouts/presentation/view/advanced_page.dart';
import 'package:graduation_project/features/Workouts/presentation/view/begginer_page.dart';
import 'package:graduation_project/features/Workouts/presentation/view/intermediate_page.dart';
import 'package:graduation_project/features/Workouts/presentation/view/widgets/toggle_bar.dart';
import 'package:graduation_project/features/widgets/custom_app_bar.dart';

class ExerciseScreen extends StatefulWidget {
  const ExerciseScreen({super.key});

  @override
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  int selectedIndex = 0; // Track the selected index
  late PageController _pageController; // PageView controller

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeumorphicTheme.baseColor(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            children: [
              CustomAppBar(),
              SizedBox(height: 20),

              // Pass selectedIndex & callback function
              ToggleBar(
                selectedIndex: selectedIndex,
                onIndexChanged: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                  _pageController.animateToPage(index,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut);
                },
              ),

              SizedBox(height: 20),

              // PageView with Swipe Support
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      selectedIndex = index; // Sync toggle with swipe
                    });
                  },
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

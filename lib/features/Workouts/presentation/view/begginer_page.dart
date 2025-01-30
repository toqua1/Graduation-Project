import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:graduation_project/core/Services/responsive_function.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/features/Workouts/presentation/view/exercise_item_screen.dart';
import 'package:graduation_project/features/Workouts/presentation/view/widgets/play_button.dart';
import 'package:graduation_project/features/Workouts/presentation/view/widgets/warm_up_section.dart';

class BegginerPage extends StatelessWidget {
  const BegginerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Featured Image Section
        WarmUpSection(),
        const SizedBox(height: 20),
        // Exercises List
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: responsiveSize(context, 0, 30)),
            child: ListView(
              children: List.generate(6, (index) {
                return Padding(
                  padding: EdgeInsets.all(responsiveSize(context, 0, 10)),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ExerciseItemScreen()));
                    },
                    child: ListTile(
                      leading: Neumorphic(
                        style: NeumorphicStyle(depth: 4, intensity: 5),
                        child: Image.asset("lib/assets/Rectangle 5912.png"),
                      ),
                      title: Text(
                        "Exercise ${index + 1}",
                        style: AppFonts.bodyTextMediumBlack,
                      ),
                      subtitle: Text(
                        index.isEven ? "00:53" : "${(index + 1) * 5}x",
                        style: AppFonts.subtitle,
                      ),
                      trailing: PlayButton(),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_ruler_picker/flutter_ruler_picker.dart';
import 'package:graduation_project/core/Services/is_tablet.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/features/Setup/presentation/view/widgets/app_bar.dart';
import 'package:graduation_project/features/Setup/presentation/view/widgets/setup_button.dart';

class HeightSelectionScreen extends StatefulWidget {
  const HeightSelectionScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HeightSelectionScreenState createState() => _HeightSelectionScreenState();
}

class _HeightSelectionScreenState extends State<HeightSelectionScreen> {
  double selectedWeight = 75.0;

  List<RulerRange> ranges = const [
    RulerRange(begin: 0, end: 10, scale: 0.1),
    RulerRange(begin: 10, end: 100, scale: 1),
    RulerRange(begin: 100, end: 1000, scale: 10),
    RulerRange(begin: 1000, end: 10000, scale: 100),
    RulerRange(begin: 10000, end: 100000, scale: 1000)
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: NeumorphicTheme.baseColor(context),
      appBar: SetUpAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "What Is Your Height?",
            style: AppFonts.setupHeader.copyWith(
                fontSize: isTablet(context) ? screenHeight * 0.037 : null),
          ),
          SizedBox(height: isTablet(context) ? 50 : 30),
          RulerPicker(
            controller: RulerPickerController(value: selectedWeight),
            onValueChanged: (value) =>
                setState(() => selectedWeight = value.toDouble()),
            width: MediaQuery.of(context).size.width,
            height: 80,
            onBuildRulerScaleText: (int index, num rulerScaleValue) {
              return rulerScaleValue.toInt().toString();
            },
            ranges: ranges,
          ),
          SizedBox(height: 30),
          SetupButton(
            size: size,
            text: 'Continue',
            method: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HeightSelectionScreen()),
            ),
          ),
        ],
      ),
    );
  }
}

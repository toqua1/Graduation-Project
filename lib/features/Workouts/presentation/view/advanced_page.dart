import 'package:flutter/material.dart';
import 'package:graduation_project/core/constants.dart';

class AdvancedPage extends StatelessWidget {
  const AdvancedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Image.asset('lib/assets/giraff.png'),
      // Lottie.asset('lib/assets/Animation - 1737853640121.json', height: 300),
      Text(
        'There are no exercises yet.',
        style: AppFonts.bodyTextBlack,
      )
    ]);
    ;
  }
}

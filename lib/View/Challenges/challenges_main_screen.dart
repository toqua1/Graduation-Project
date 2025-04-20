import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:graduation_project/View/widgets/custom_app_bar.dart';

class ChallengesMainScreen extends StatelessWidget {
  const ChallengesMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeumorphicTheme.baseColor(context),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          children: [
            CustomAppBar(title: 'Challenges'),
            const SizedBox(height: 20),
          ],
        ),
      )),
    );
  }
}

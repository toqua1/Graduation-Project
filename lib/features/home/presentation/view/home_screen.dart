import 'package:flutter/material.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'hi, Toqua',
                style: AppFonts.headline1,
              ),
              Text(
                'It\'s time to challenge your limits.',
                style: AppFonts.subtitle,
              ),
            ],
          ),
          actions: [
            NeumorphicButton(
              onPressed: () {
                print("onClick");
              },
              style: NeumorphicStyle(
                shape: NeumorphicShape.flat,
                boxShape: NeumorphicBoxShape.circle(),
              ),
              padding: const EdgeInsets.all(10.0),
              child: Icon(
                Icons.notifications,
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            NeumorphicButton(
              onPressed: () {
                print("onClick");
              },
              style: NeumorphicStyle(
                shape: NeumorphicShape.flat,
                boxShape: NeumorphicBoxShape.circle(),
              ),
              padding: const EdgeInsets.all(10.0),
              child: Icon(
                Icons.person,
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(
              width: 10,
            )
          ],
        ),
        body: SafeArea(
            child: Container(
          color: AppColors.backgroundColor,
        )));
  }
}

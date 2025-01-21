import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/features/home/presentation/view/widgets/articles_listView.dart';
import 'dart:math';
import 'package:graduation_project/features/home/presentation/view/widgets/card_slider.dart';
import 'package:graduation_project/features/home/presentation/view/widgets/section_and_title.dart';
import 'package:graduation_project/features/home/presentation/view/widgets/weekly_challenge.dart';
import 'widgets/neumorphic_reco_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      // backgroundColor: AppColors.backgroundColor,
      backgroundColor: NeumorphicTheme.baseColor(context),
      appBar: _buildAppBar(context),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 16, top: 20, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CardSlider(),
              SectionAndTitle(title: "Recommendations"),
              const SizedBox(height: 10),
              _buildRecommendationsSlider(),
              SectionAndTitle(title: "Weekly Challenge"),
              const SizedBox(height: 10),
              WeeklyChallenge(),
              const SizedBox(height: 20),
              SectionAndTitle(title: "Articles & Tips"),
              const SizedBox(height: 10),
              ArticlesListView(),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Hi, Toqua', style: AppFonts.headline1),
          Text('It\'s time to challenge your limits.',
              style: AppFonts.subtitle),
        ],
      ),
      actions: [
        _neumorphicIconButton(Icons.notifications, AppColors.primaryColor,
            Theme.of(context).colorScheme.onTertiary),
        const SizedBox(width: 10),
        _neumorphicIconButton(Icons.person, AppColors.primaryColor,
            Theme.of(context).colorScheme.onTertiary),
        const SizedBox(width: 10),
      ],
    );
  }

  Widget _neumorphicIconButton(
      IconData icon, Color foreColor, Color backColor) {
    return NeumorphicButton(
      onPressed: () {},
      style: NeumorphicStyle(
          shape: NeumorphicShape.flat,
          depth: 4,
          boxShape: NeumorphicBoxShape.circle(),
          color: backColor),
      padding: const EdgeInsets.all(10),
      child: Icon(icon, color: foreColor),
    );
  }

  Widget _buildRecommendationsSlider() {
    return SizedBox(
      height: 175, // Adjusted height to accommodate margins
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
                left: 8.0, right: 8.0, bottom: 10.0), // Added padding
            child: SizedBox(
              width: 200,
              child: Stack(
                children: [
                  NeumorphicRecoItem(),
                  Positioned(
                    top: 80,
                    right: 15,
                    child: _neumorphicIconButton(
                      Icons.play_arrow_rounded,
                      Colors.white,
                      AppColors.secondaryColor,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

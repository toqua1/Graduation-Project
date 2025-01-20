//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: AppColors.backgroundColor,
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           title: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'hi, Toqua',
//                 style: AppFonts.headline1,
//               ),
//               Text(
//                 'It\'s time to challenge your limits.',
//                 style: AppFonts.subtitle,
//               ),
//             ],
//           ),
//           actions: [
//             NeumorphicButton(
//               onPressed: () {
//                 print("onClick");
//               },
//               style: NeumorphicStyle(
//                 shape: NeumorphicShape.flat,
//                 boxShape: NeumorphicBoxShape.circle(),
//               ),
//               padding: const EdgeInsets.all(10.0),
//               child: Icon(
//                 Icons.notifications,
//                 color: AppColors.primaryColor,
//               ),
//             ),
//             SizedBox(
//               width: 10,
//             ),
//             NeumorphicButton(
//               onPressed: () {
//                 print("onClick");
//               },
//               style: NeumorphicStyle(
//                 shape: NeumorphicShape.flat,
//                 boxShape: NeumorphicBoxShape.circle(),
//               ),
//               padding: const EdgeInsets.all(10.0),
//               child: Icon(
//                 Icons.person,
//                 color: AppColors.primaryColor,
//               ),
//             ),
//             SizedBox(
//               width: 10,
//             )
//           ],
//         ),
//         body: SafeArea(
//             child: Container(
//           color: AppColors.backgroundColor,
//         )));
//   }
// }
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:graduation_project/core/constants.dart';
import 'dart:math';

import 'package:graduation_project/features/home/presentation/view/widgets/card_slider.dart';

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
              _buildSectionTitle(context, "Recommendations"),
              const SizedBox(height: 10),
              _buildRecommendationsSlider(),
              // const SizedBox(height: 20),
              _buildSectionTitle(context, "Weekly Challenge"),
              const SizedBox(height: 10),
              _buildWeeklyChallengeCard(),
              const SizedBox(height: 20),
              _buildSectionTitle(context, "Articles & Tips"),
              const SizedBox(height: 10),
              _buildArticlesRow(),
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

  // Widget _buildAIButtons(BuildContext context) {
  //   return SingleChildScrollView(
  //     scrollDirection: Axis.horizontal,
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         _buildNeumorphicCard(
  //             "Chat with our AI chatbot", Icons.chat_rounded, "Start Chatting"),
  //         _buildNeumorphicCard(
  //             "Progress Tracker", Icons.track_changes, "See your track"),
  //       ],
  //     ),
  //   );
  // }

  // Widget _buildNeumorphicCard(String title, IconData icon, String buttonText) {
  //   return Stack(clipBehavior: Clip.none, children: [
  //     Neumorphic(
  //       margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
  //       style: NeumorphicStyle(
  //         depth: 5,
  //         intensity: 10,
  //         boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
  //       ),
  //       child: Container(
  //         height: 120,
  //         width: 240,
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(12),
  //           gradient: LinearGradient(
  //               begin: Alignment.topLeft,
  //               end: Alignment.bottomRight,
  //               colors: [Color(0xff14919B), Colors.limeAccent]),
  //         ),
  //         padding: const EdgeInsets.all(10),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Row(
  //               children: [
  //                 Icon(icon, color: Colors.white, size: 28),
  //                 const SizedBox(width: 10),
  //                 Expanded(
  //                     child: Text(title, style: AppFonts.bodyTextBoldWhite)),
  //               ],
  //             ),
  //             Spacer(),
  //             SizedBox(
  //               height: 30,
  //               width: 140,
  //               child: ElevatedButton(
  //                 onPressed: () {},
  //                 style: ElevatedButton.styleFrom(
  //                     backgroundColor: Color(0xff2A282F).withOpacity(0.80),
  //                     shape: RoundedRectangleBorder(
  //                         borderRadius: BorderRadius.circular(8))),
  //                 child: Center(
  //                     child: Text(buttonText, style: AppFonts.bodyTextWhite2)),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   ]);
  // }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppFonts.headline2),
        Row(
          children: [
            TextButton(
              onPressed: () {},
              child: Text("See All", style: AppFonts.bodyTextLight1),
            ),
            Transform.rotate(
              angle: pi / 2,
              child: Icon(
                Icons.arrow_drop_up,
                color: AppColors.primaryColor,
                size: 30,
              ),
            )
          ],
        ),
      ],
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
                  Neumorphic(
                    style: NeumorphicStyle(
                      depth: 4,
                      // intensity: 4,
                      color: Colors.white,
                      boxShape: NeumorphicBoxShape.roundRect(
                        BorderRadius.circular(12),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(12),
                            ),
                            image: const DecorationImage(
                              image: AssetImage('lib/assets/img1.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10),
                              Text(
                                "Squat Exercise",
                                style: AppFonts.primaryTextThin,
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.timer,
                                        size: 14,
                                        color: AppColors.secondaryColor,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        "12 Minutes",
                                        style: AppFonts.bodyTextExtraThinBlack,
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.local_fire_department,
                                        size: 14,
                                        color: AppColors.secondaryColor,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        "120 Kcal",
                                        style: AppFonts.bodyTextExtraThinBlack,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
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

  Widget _buildWeeklyChallengeCard() {
    return Neumorphic(
      style: NeumorphicStyle(
        depth: -2,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(Icons.fitness_center, size: 40, color: AppColors.primaryColor),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                "Burn 500 calories today using any exercise in the app.",
                style: AppFonts.subtitle,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildArticlesRow() {
    return Row(
      children: [
        _buildArticleCard(),
        const SizedBox(width: 16),
        _buildArticleCard(),
      ],
    );
  }

  Widget _buildArticleCard() {
    return Expanded(
      child: Container(
        height: 130,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                image: DecorationImage(
                  image: AssetImage('lib/assets/img2.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Jerome Bel", style: AppFonts.subtitle),
                  Text(
                    "Constructive and destructive waves",
                    style:
                        AppFonts.subtitle.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

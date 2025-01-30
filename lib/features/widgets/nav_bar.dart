import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/Services/Controllers/nav_bar_controller.dart';
import 'package:graduation_project/core/Services/responsive_function.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/features/Community/presentation/view/home_community.dart';
import 'package:graduation_project/features/Favourites/presentation/view/favourite_screen.dart';
import 'package:graduation_project/features/Workouts/presentation/view/workouts_screen.dart';
import 'package:graduation_project/features/home/presentation/view/home_screen.dart';
import 'package:iconsax/iconsax.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeNavBar extends StatelessWidget {
  HomeNavBar({super.key});
  final NavController controller = Get.put(NavController());

  final List<Widget> pages = [
    HomeScreen(),
    WorkoutsScreen(),
    FavouriteScreen(),
    HomeCommunity(),
  ];

  @override
  Widget build(BuildContext context) {
    double iconSize = responsiveSize(context, 6.sw, 4.sw);

    return Scaffold(
      resizeToAvoidBottomInset: false, // Prevents resizing

      extendBody: true,
      body: Obx(() => pages[controller.currentIndex.value]),
      bottomNavigationBar: Obx(() {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: responsiveSize(context, 5.sw, 15.sw),
            vertical: 10,
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                // Glassmorphic Background
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    height: responsiveSize(context, 9.sh, 8.sh),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.white.withOpacity(0.3)),
                    ),
                  ),
                ),

                // Moving Yellow Indicator
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  left: (controller.currentIndex.value) *
                      MediaQuery.of(context).size.width /
                      responsiveSize(
                          context, 4.5, 5.5), // Adjust for number of items
                  child: Container(
                    width: MediaQuery.of(context).size.width /
                        responsiveSize(context, 4.5, 6.5),
                    height: responsiveSize(context, 8, 10),
                    decoration: const BoxDecoration(
                      color: AppColors.secondaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                      ),
                    ),
                  ),
                ),

                // Navigation Bar Items
                SizedBox(
                  height: responsiveSize(context, 9.sh, 8.sh),
                  child: BottomNavigationBar(
                    elevation: 0,
                    selectedLabelStyle: AppFonts.navText,
                    unselectedLabelStyle: AppFonts.navTextInactive,
                    selectedItemColor: Colors.black,
                    unselectedItemColor: const Color(0xff6D6C6E),
                    type: BottomNavigationBarType.fixed,
                    currentIndex: controller.currentIndex.value,
                    onTap: controller.changeIndex,
                    backgroundColor:
                        Colors.transparent, // Transparent for glass effect
                    items: [
                      BottomNavigationBarItem(
                        icon: Icon(Iconsax.home, size: iconSize),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(
                          Icons.fitness_center_outlined,
                          size: iconSize,
                        ),
                        label: 'Workouts',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(
                          Icons.favorite_border_rounded,
                          size: iconSize,
                        ),
                        label: 'Favourites',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(
                          Icons.groups_2_outlined,
                          size: iconSize,
                        ),
                        label: 'Community',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

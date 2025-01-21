import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/Services/responsive_function.dart';
import 'package:graduation_project/features/home/presentation/view/home_screen.dart';
import 'package:iconsax/iconsax.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeNavBar extends StatelessWidget {
  HomeNavBar({super.key});

  final RxInt currentIndex = 0.obs;
  // final RxBool isDrawerOpen = false.obs;

  final List<Widget Function()> pageFactories = [
    () => HomeScreen(),
    () => HomeScreen(),
    () => HomeScreen(),
    () => HomeScreen()
  ];

  @override
  Widget build(BuildContext context) {
    double iconSize = 4.sw;

    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Obx(() => Padding(
            padding: EdgeInsets.symmetric(
                horizontal: responsiveSize(context, 5.sw, 15.sw), vertical: 10),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(30.0)),
              child: NavigationBar(
                height: responsiveSize(context, 50, 70),
                elevation: 0,
                selectedIndex: currentIndex.value,
                onDestinationSelected: (index) => currentIndex.value = index,
                backgroundColor: Colors.white,
                indicatorColor: Colors.blueAccent.withOpacity(0.2),
                destinations: [
                  NavigationDestination(
                      icon: Icon(Iconsax.home, size: iconSize),
                      label: 'Home'.tr),
                  NavigationDestination(
                      icon: Icon(
                        Iconsax.scanner,
                        size: iconSize,
                      ),
                      label: 'Scan'.tr),
                  NavigationDestination(
                      icon: Icon(
                        Iconsax.wallet_2,
                        size: iconSize,
                      ),
                      label: 'Wallet'.tr),
                ],
              ),
            ),
          )),
      body: Stack(children: [
        Obx(() => pageFactories[currentIndex.value]()),
        // isDrawerOpen.value?const CustomDrawer():const SizedBox(),
      ]),
    );
  }
}

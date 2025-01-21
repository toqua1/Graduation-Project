import 'package:flutter/material.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/features/home/presentation/view/home_screen.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:
          const Size(360, 690), // Design size of the app (width x height)
      minTextAdapt:
          true, // Ensures text adapts properly for different screen sizes
      splitScreenMode:
          true, // Handles split-screen scenarios (like multitasking)
      builder: (context, child) {
        return NeumorphicApp(
          title: 'Flutter Demo',
          themeMode: ThemeMode.light,
          theme: NeumorphicThemeData(
            baseColor: AppColors.backgroundColor,
            lightSource: LightSource.topLeft,
            depth: 10,
          ),
          darkTheme: NeumorphicThemeData(
            baseColor: const Color(0xFF3E3E3E),
            lightSource: LightSource.topLeft,
            depth: 6,
          ),
          home: const HomeScreen(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}

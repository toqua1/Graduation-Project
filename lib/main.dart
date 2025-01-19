import 'package:flutter/material.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/features/home/presentation/view/home_screen.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
      theme: NeumorphicThemeData(
        baseColor: Color(0xFFFFFFFF),
        lightSource: LightSource.topLeft,
        depth: 10,
      ),
      darkTheme: NeumorphicThemeData(
        baseColor: Color(0xFF3E3E3E),
        lightSource: LightSource.topLeft,
        depth: 6,
      ),
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
      //   useMaterial3: true,
      // ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

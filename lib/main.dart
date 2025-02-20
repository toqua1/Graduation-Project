import 'package:device_preview/device_preview.dart';
import 'package:flutter/services.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:graduation_project/features/Auth/presentation/view/login_screen.dart';
import 'package:graduation_project/features/widgets/nav_bar.dart';
import 'package:get_storage/get_storage.dart';
import 'package:responsive_builder/responsive_builder.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init(); // Initialize storage

  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return ResponsiveApp(
      builder: (context) {
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
          home: LoginScreen(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}

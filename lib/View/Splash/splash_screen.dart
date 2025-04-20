import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/View/Auth/login_screen.dart';
import 'package:graduation_project/View/OnBoarding/on_boarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/nav_bar.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _controller.forward();

    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool introSeen = prefs.getBool('introSeen') ?? false;
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    await Future.delayed(const Duration(seconds: 4));

    if (isLoggedIn) {
       context.pushAndRemoveUntilTransition(
        type: PageTransitionType.fade,
        child: HomeNavBar(),
         predicate: (Route<dynamic> route) => false,
      );
    } else if (introSeen) {
      context.pushReplacementTransition(
        type: PageTransitionType.fade,
        child: LoginScreen(),
      );
    } else {
      context.pushReplacementTransition(
        type: PageTransitionType.fade,
        child: OnBoardingScreen(),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double logoWidth = MediaQuery.of(context).size.width * 0.9;

    return Scaffold(
      backgroundColor: NeumorphicTheme.baseColor(context),
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: SvgPicture.asset(
            'lib/assets/icons/logo.svg',
            width: logoWidth,
          ),
        ),
      ),
    );
  }
}
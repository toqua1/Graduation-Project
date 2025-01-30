import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/Services/responsive_function.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class WaitingScreen extends StatelessWidget {
  const WaitingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var spin = SpinKitCircle(
      color: AppColors.primaryColor,
      size: responsiveSize(context, 50, 70),
    );
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      /*should match with bottom container */
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: WaitingTopContainer(size: size),
          ),
          Expanded(
            flex: 2,
            child: WaitingBottomContainer(
              spin: spin,
              size: size,
            ),
          ),
        ],
      ),
    );
  }
}

class WaitingBottomContainer extends StatelessWidget {
  const WaitingBottomContainer({
    super.key,
    required this.spin,
    required this.size,
  });
  final Size size;
  final SpinKitCircle spin;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: double.infinity,
          color: Colors.white,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'lib/assets/Let’s Go !.svg',
              width: size.width * responsiveSize(context, 0.48, 0.4),
            ),
            const SizedBox(height: 10),
            spin,
          ],
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Image.asset('lib/assets/medal.png',
              width: size.width * responsiveSize(context, 0.3, 0.2)),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Image.asset(
            'lib/assets/streak.png',
            width: size.width * responsiveSize(context, 0.4, 0.3),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: Image.asset('lib/assets/lighting.png',
              width: size.width * responsiveSize(context, 0.3, 0.4)),
        ),
        Positioned(
          bottom: 30,
          right: 30,
          child: Image.asset('lib/assets/thumb.png',
              width: size.width * responsiveSize(context, 0.3, 0.2)),
        ),
        Positioned(
          bottom: 0,
          right: size.width * responsiveSize(context, 0.35, 0.4),
          child: Image.asset(
            'lib/assets/dumbellIcon.png',
          ),
        ),
      ],
    );
  }
}

class WaitingTopContainer extends StatelessWidget {
  const WaitingTopContainer({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.secondaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(200),
              bottomRight: Radius.circular(200),
            ),
          ),
        ),
        Positioned(
          bottom: responsiveSize(context, 0, -100),
          left: responsiveSize(context, size.width * 0.03, size.width * 0.1),
          child: Image.asset(
            'lib/assets/dumbell2.png',
            width: size.width * responsiveSize(context, 0.85, 0.70),
          ),
        ),
        Positioned(
          top: 60,
          left: responsiveSize(context, -40, -80),
          child: Image.asset(
            'lib/assets/timer.png',
            width: size.width * responsiveSize(context, 0.4, 0.3),
          ),
        ),
        Positioned(
          left: size.width * responsiveSize(context, 0.2, 0.3),
          child: Image.asset(
            'lib/assets/boxing2.png',
            width: size.width * responsiveSize(context, 0.6, 0.4),
          ),
        ),
        Positioned(
          right: -20,
          top: 90,
          child: Image.asset(
            'lib/assets/weights.png',
            width: size.width * responsiveSize(context, 0.27, 0.2),
          ),
        ),
      ],
    );
  }
}

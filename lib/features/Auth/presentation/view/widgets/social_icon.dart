import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/Services/responsive_function.dart';

class SocialIcon extends StatelessWidget {
  const SocialIcon({
    super.key,
    required this.width,
    required this.svgPicPath,
  });
  final double width;
  final String svgPicPath;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: width * responsiveSize(context, 0.14, 0.09),
          height: width * responsiveSize(context, 0.14, 0.09),
          child: NeumorphicButton(
            onPressed: () {},
            style: NeumorphicStyle(
                depth: 5,
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(16))),
            child: SvgPicture.asset(
              svgPicPath,
            ),
          ),
        )
      ],
    );
  }
}

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:graduation_project/features/Auth/presentation/view/widgets/social_icon.dart';

class SocialIconsRow extends StatelessWidget {
  const SocialIconsRow({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialIcon(
          width: width,
          svgPicPath: 'lib/assets/googleSvg2.svg',
        ),
        SizedBox(
          width: width * 0.05,
        ),
        SocialIcon(
          width: width,
          svgPicPath: 'lib/assets/apple.svg',
        ),
      ],
    );
  }
}

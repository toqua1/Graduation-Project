import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/Services/responsive_function.dart';

class WarmUpSection extends StatelessWidget {
  const WarmUpSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Neumorphic(
      style: NeumorphicStyle(
        depth: -6,
        intensity: 6,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(22)),
        shape: NeumorphicShape.flat,
      ),
      child: Container(
        height: 170,
        width: responsiveSize(context, double.infinity, width * 0.7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Container(
                height: 170,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SvgPicture.asset(
                  'lib/assets/warmUp.svg',
                  fit: BoxFit.cover,
                )),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Warm Up your body first",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(Icons.favorite_border, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

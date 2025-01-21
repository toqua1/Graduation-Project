import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:graduation_project/core/Services/responsive_function.dart';

class WeeklyChallenge extends StatelessWidget {
  const WeeklyChallenge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: responsiveSize(context, 20.0, 30.0),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Neumorphic(
            style: NeumorphicStyle(
              depth: 4,
              boxShape: NeumorphicBoxShape.roundRect(
                BorderRadius.circular(
                  responsiveSize(context, 12.0, 16.0),
                ),
              ),
            ),
            child: Container(
              padding: EdgeInsets.all(
                responsiveSize(context, 10.0, 16.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Padding(
                    padding: EdgeInsets.only(
                      right: responsiveSize(
                          context, 70.0, 100.0), // Leave space for the image
                    ),
                    child: Text(
                      "Burn 500 calories today using any exercise in the app.",
                      style: TextStyle(
                        fontSize: responsiveSize(
                            context, 16.0, 20.0), // Responsive text size
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: responsiveSize(context, 5.0, 8.0)),
                  Row(
                    children: [
                      Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_border,
                          size: responsiveSize(
                              context, 24.0, 32.0), // Responsive icon size
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: responsiveSize(context, 20.0, 30.0),
            top: -responsiveSize(context, 40.0, 50.0),
            child: Image.asset(
              'lib/assets/dumbell.png',
              height: responsiveSize(context, 80.0, 100.0),
              width: responsiveSize(context, 80.0, 100.0),
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}

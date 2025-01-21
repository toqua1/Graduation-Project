// import 'package:flutter_neumorphic/flutter_neumorphic.dart';
// import 'package:graduation_project/core/constants.dart';

// class WeeklyChallenge extends StatelessWidget {
//   const WeeklyChallenge({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Neumorphic(
//         style: NeumorphicStyle(
//           depth: 4,
//           boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
//         ),
//         child: Container(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Burn 500 calories today using any exercise in the app.",
//                 style: AppFonts.headlineTextBlack,
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Icon(
//                 Icons.favorite_border,
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeeklyChallenge extends StatelessWidget {
  const WeeklyChallenge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil for responsiveness
    ScreenUtil.init(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Neumorphic(
            style: NeumorphicStyle(
              depth: 4,
              boxShape:
                  NeumorphicBoxShape.roundRect(BorderRadius.circular(12.r)),
            ),
            child: Container(
              padding: EdgeInsets.all(10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Padding(
                    padding: EdgeInsets.only(
                        right: 70.w), // Leave space for the image
                    child: Text(
                      "Burn 500 calories today using any exercise in the app.",
                      style: TextStyle(
                        fontSize: 16.sp, // Responsive text size
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    children: [
                      Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite_border,
                            size: 24.h,
                            color: Colors.grey,
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 20,
            top: -50,
            child: Image.asset(
              'lib/assets/dumbell.png',
              height: 80.h,
              width: 80.h,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}

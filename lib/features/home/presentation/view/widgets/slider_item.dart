import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:graduation_project/core/constants.dart';

class SliderItem extends StatelessWidget {
  const SliderItem({
    super.key,
    required this.title,
    required this.icon,
    required this.buttonText,
  });
  final String title;
  final IconData icon;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      Neumorphic(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
        style: NeumorphicStyle(
          depth: 5,
          intensity: 10,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
        ),
        child: Container(
          // height: 120,
          // width: 240,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xff14919B), Colors.limeAccent]),
          ),
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon, color: Colors.white, size: 28),
                  const SizedBox(width: 10),
                  Expanded(
                      child: Text(title, style: AppFonts.bodyTextBoldWhite)),
                ],
              ),
              Spacer(),
              SizedBox(
                height: 30,
                width: 140,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff2A282F).withOpacity(0.80),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  child: Center(
                      child: Text(buttonText, style: AppFonts.bodyTextWhite2)),
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}

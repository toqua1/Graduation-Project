import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class SlideToGoButton extends StatelessWidget {
  const SlideToGoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.arrow_forward, color: Colors.white),
            SizedBox(width: 8),
            Text('Slide to Go',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

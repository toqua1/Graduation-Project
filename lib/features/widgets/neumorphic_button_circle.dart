import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NeumorphicCircleButton extends StatelessWidget {
  const NeumorphicCircleButton({
    super.key,
    required this.icon,
    required this.foreColor,
    required this.backColor,
  });
  final IconData icon;
  final Color foreColor;
  final Color backColor;

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      onPressed: () {},
      style: NeumorphicStyle(
          shape: NeumorphicShape.flat,
          depth: 4,
          boxShape: NeumorphicBoxShape.circle(),
          color: backColor),
      padding: const EdgeInsets.all(10),
      child: Icon(icon, color: foreColor),
    );
  }
}

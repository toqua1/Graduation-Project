import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../core/constants.dart';

class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({Key? key, required this.width, required this.height}) : super(key: key);
  final double width ;
  final double height ;

  @override
  Widget build(BuildContext context) {
    var spin=SpinKitCircle(color: AppColors.secondaryColor);
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
              ),
            ),
          ),
          Center(child: spin)
        ],
      ),
    );
  }
}
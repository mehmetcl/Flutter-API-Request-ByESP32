import 'package:flutter/material.dart';

class LampHangerRope extends StatelessWidget {
  const LampHangerRope(
      {Key? key, required this.screenWidth, required this.screenHeight,required this.color})
      : super(key: key);
  final Color color;
  final double screenWidth, screenHeight;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: screenWidth*0.48,
      child: Container(
        color:color,
        height: screenHeight *0.15,
        width: 13,

      ),
    );
  }
}

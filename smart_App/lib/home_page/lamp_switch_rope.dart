import 'package:flutter/material.dart';

class LampSwitchRope extends StatelessWidget {
  final Color color;
  final double screenWidth, screenHeight;
  final bool isSwicthOn;
  final Duration animatedDuration;

  const LampSwitchRope(
      {super.key,
      required this.color,
      required this.screenWidth,
      required this.screenHeight,
      required this.isSwicthOn,
      required this.animatedDuration});

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(

        top: screenHeight * 0.2,
        bottom: screenHeight * (isSwicthOn ?0.35:0.40),
        width: 1,
        right: screenWidth * 0.22 - 1,
        duration: animatedDuration,
        child: Container(
          color: color,
        ));
  }
}

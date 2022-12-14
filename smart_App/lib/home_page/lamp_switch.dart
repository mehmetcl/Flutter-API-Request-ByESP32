import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:smart_app/home_page/home_page.dart';

class LampSwitch extends StatelessWidget {
  final Function()? onTap;
  final bool isSwitchOn;
  final screenWidth, screenHeight;
  final Duration animationDuration;
  final Color toggleOffColor, toggleOnColor, color;

  const LampSwitch(
      {this.onTap,
      required this.isSwitchOn,
      this.screenWidth,
      this.screenHeight,
      required this.animationDuration,
      required this.toggleOffColor,
      required this.toggleOnColor,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: screenHeight * 0.31,
      width: 30,
      left: screenWidth * 0.75,
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            AnimatedContainer(
              duration: animationDuration,
              width: 30,
              height: 70,
              decoration: BoxDecoration(
                color: isSwitchOn ? bulbOnColor : bulbOFFColor,
                borderRadius: BorderRadius.circular(13),
              ),
            ),
            AnimatedPositioned(
              duration: animationDuration,
              top: isSwitchOn ? 42 : 5,
              width: 30,
              height: 24,
              child: Container(
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

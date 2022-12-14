import 'package:flutter/material.dart';
import 'package:smart_app/home_page/home_page.dart';

class LEDBulb extends StatelessWidget {
  const LEDBulb({
    Key? key,
    required this.onColor,
    required this.offColor,
    required this.screenWidth,
    required this.screenHeight,
    required this.isSwicthOn,
  }) : super(key: key);
  final onColor, offColor;
  final double screenWidth, screenHeight;
  final bool isSwicthOn;
  final Duration animationDuration = const Duration(milliseconds: 4000);
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: screenWidth * 0.38,
      top: screenHeight * 0.15,
      child: AnimatedContainer(
        duration: animationDuration,
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSwicthOn ? onColor : offColor,
        ),
      ),
    );
  }
}

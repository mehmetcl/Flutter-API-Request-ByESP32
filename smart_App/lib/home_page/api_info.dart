import 'package:flutter/material.dart';

class AppInfo extends StatelessWidget {
  final double screenWidth, screenHeight;
  final Color color;
  final String state;

  AppInfo({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.color,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: screenWidth * 0.1 - 160,
      bottom: screenHeight * 0.22,
      width: screenWidth,
      child: Center(
        child: Transform.rotate(
          angle: -1.58,
          child: Text(
            state.toUpperCase(),
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 26,
            ),
          ),
        ),
      ),
    );
  }
}

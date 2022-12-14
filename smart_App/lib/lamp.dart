import 'package:flutter/material.dart';

class Lamp extends StatelessWidget {
  final Color color, gradientColor;
  final double screenWidth, screenHeight;
  final bool isSwicthOn;
  final Duration animatedDuration;

  const Lamp(
      {super.key,
      required this.color,
      required this.screenWidth,
      required this.screenHeight,
      required this.isSwicthOn,
      required this.gradientColor,
      required this.animatedDuration});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: screenHeight * 0.2,
          color: color,
        ),
        AnimatedContainer(
          duration: animatedDuration,
          height: screenHeight * 0.75,
          decoration: BoxDecoration(
              gradient: isSwicthOn
                  ? LinearGradient(
                      colors: [
                        gradientColor.withOpacity(0.4),
                        gradientColor.withOpacity(0.01),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    )
                  : null),
        ),
      ],
    );
  }
}

class TrapezoidClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width * 0.3, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width / 1.3, size.height);
    path.lineTo(size.width * 0.7, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    throw false;
  }
}

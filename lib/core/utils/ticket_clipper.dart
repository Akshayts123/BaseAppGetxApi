import 'package:flutter/material.dart';

class TicketClipper extends CustomClipper<Path> {
  final bool isTopLeft;
  final bool isTopRight;
  final bool isBottomLeft;
  final bool isBottomRight;
  final double radius;

  TicketClipper({
    this.isTopLeft = false,
    this.isTopRight = false,
    this.isBottomLeft = false,
    this.isBottomRight = false,
    required this.radius,
  });

  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    if (isTopRight) {
      path.addOval(
        Rect.fromCircle(
          center: Offset(size.width, 0),
          radius: radius,
        ),
      );
    }

    if (isBottomRight) {
      path.addOval(
        Rect.fromCircle(
          center: Offset(size.width, size.height),
          radius: radius,
        ),
      );
    }

    if (isTopLeft) {
      path.addOval(
        Rect.fromCircle(
          center: const Offset(0, 0),
          radius: radius,
        ),
      );
    }

    if (isBottomLeft) {
      path.addOval(
        Rect.fromCircle(
          center: Offset(0, size.height),
          radius: radius,
        ),
      );
    }

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

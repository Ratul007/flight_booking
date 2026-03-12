import 'package:flutter/cupertino.dart';

class CustomTicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 30; // Corner radius
    double cutoutRadius = 20; // Side cutout radius
    double cutoutDepth = 30; // Depth of side cutout

    Path path = Path()
      ..moveTo(radius, 0) // Start from top-left corner
      ..lineTo(size.width - radius, 0)
      ..quadraticBezierTo(size.width, 0, size.width, radius)
      ..lineTo(size.width, size.height / 1.6 - cutoutRadius) // Upper part of right cutout
      ..quadraticBezierTo(size.width - cutoutDepth, size.height / 1.6, size.width, size.height / 1.6 + cutoutRadius) // Right side middle cutout
      ..lineTo(size.width, size.height - radius)
      ..quadraticBezierTo(size.width, size.height, size.width - radius, size.height)
      ..lineTo(radius, size.height)
      ..quadraticBezierTo(0, size.height, 0, size.height - radius)
      ..lineTo(0, size.height / 1.6 + cutoutRadius) // Lower part of left cutout
      ..quadraticBezierTo(cutoutDepth, size.height / 1.6, 0, size.height / 1.6 - cutoutRadius) // Left side middle cutout
      ..lineTo(0, radius)
      ..quadraticBezierTo(0, 0, radius, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
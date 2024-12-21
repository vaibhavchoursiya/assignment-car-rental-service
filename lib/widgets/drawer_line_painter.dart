import 'package:flutter/material.dart';

class DrawerLinePainter extends CustomPainter {
  final double strokeWidth;

  DrawerLinePainter({required this.strokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    var center = size / 2;

    paint.color = Colors.black54;
    paint.strokeWidth = strokeWidth;
    paint.strokeCap = StrokeCap.round;

    canvas.drawLine(Offset(10, center.height - strokeWidth),
        Offset(size.width - 19.0, center.height - strokeWidth), paint);

    canvas.drawLine(Offset(10, center.height + strokeWidth),
        Offset(size.width - 29.0, center.height + strokeWidth), paint);

    canvas.drawLine(Offset(10, center.height + strokeWidth * 3),
        Offset(size.width - 39.0, center.height + strokeWidth * 3), paint);

    // canvas.drawLine(
    //     const Offset(0, 17), Offset(size.width - 30.0, 17.0), paint);

    // canvas.drawLine(
    // const Offset(0, 24), Offset(size.width - 40.0, 24.0), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // throw UnimplementedError();
    return true;
  }
}

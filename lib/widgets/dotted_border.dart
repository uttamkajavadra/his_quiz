import 'package:flutter/material.dart';

class DottedBorderEX extends StatefulWidget {
  final Widget child;

  const DottedBorderEX({
    super.key,
    required this.child,
  });

  @override
  State<DottedBorderEX> createState() => _DottedBorderEXState();
}

class _DottedBorderEXState extends State<DottedBorderEX> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DottedBorderPainter(),
      child: widget.child,
    );
  }
}

class DottedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = const Color(0xFFFB923C)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double dashWidth = 5.0;
    double dashSpace = 3.0;
    double startX = 0;
    double startY = 0;

    // Draw the dotted border
    for (double i = 0; i < size.width; i += dashWidth + dashSpace) {
      canvas.drawLine(
        Offset(
          startX + i,
          startY,
        ),
        Offset(
          startX + i + dashWidth,
          startY,
        ),
        paint,
      );
    }

    for (double i = 0; i < size.height; i += dashWidth + dashSpace) {
      canvas.drawLine(
        Offset(
          startX + size.width,
          startY + i,
        ),
        Offset(
          startX + size.width,
          startY + i + dashWidth,
        ),
        paint,
      );
    }

    for (double i = 0; i < size.width; i += dashWidth + dashSpace) {
      canvas.drawLine(
        Offset(
          startX + size.width - i,
          startY + size.height,
        ),
        Offset(
          startX + size.width - i - dashWidth,
          startY + size.height,
        ),
        paint,
      );
    }

    for (double i = 0; i < size.height; i += dashWidth + dashSpace) {
      canvas.drawLine(
        Offset(
          startX,
          startY + size.height - i,
        ),
        Offset(
          startX,
          startY + size.height - i - dashWidth,
        ),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

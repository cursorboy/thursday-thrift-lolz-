import 'package:flutter/material.dart';

class DottedBackground extends StatelessWidget {
  final Widget child;
  final Color dotColor;
  final double dotSize;
  final double spacing;

  const DottedBackground({
    super.key,
    required this.child,
    this.dotColor = const Color.fromRGBO(0, 0, 0, 0.07),
    this.dotSize = 0.5,
    this.spacing = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DottedPainter(dotColor: dotColor, dotSize: dotSize, spacing: spacing),
      child: child,
    );
  }
}

class _DottedPainter extends CustomPainter {
  final Color dotColor;
  final double dotSize;
  final double spacing;

  _DottedPainter({required this.dotColor, required this.dotSize, required this.spacing});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = dotColor
      ..style = PaintingStyle.fill;

    for (double y = 0; y < size.height; y += spacing) {
      for (double x = 0; x < size.width; x += spacing) {
        canvas.drawCircle(Offset(x, y), dotSize, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
} 
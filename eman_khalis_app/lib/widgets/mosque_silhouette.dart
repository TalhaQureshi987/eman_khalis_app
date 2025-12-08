import 'package:flutter/material.dart';

class MosqueSilhouette extends StatelessWidget {
  final double width;
  final double height;
  final Color color;

  const MosqueSilhouette({
    super.key,
    this.width = 120,
    this.height = 80,
    this.color = const Color(0xFF2E7D32),
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, height),
      painter: MosquePainter(color: color),
    );
  }
}

class MosquePainter extends CustomPainter {
  final Color color;

  MosquePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();

    // Main dome
    path.addOval(
      Rect.fromCenter(
        center: Offset(size.width * 0.5, size.height * 0.3),
        width: size.width * 0.6,
        height: size.height * 0.4,
      ),
    );

    // Left minaret
    path.addRect(
      Rect.fromLTWH(
        size.width * 0.15,
        size.height * 0.1,
        size.width * 0.08,
        size.height * 0.6,
      ),
    );

    // Right minaret
    path.addRect(
      Rect.fromLTWH(
        size.width * 0.77,
        size.height * 0.1,
        size.width * 0.08,
        size.height * 0.6,
      ),
    );

    // Base structure
    path.addRect(
      Rect.fromLTWH(
        size.width * 0.1,
        size.height * 0.5,
        size.width * 0.8,
        size.height * 0.4,
      ),
    );

    // Entrance arch
    path.addOval(
      Rect.fromCenter(
        center: Offset(size.width * 0.5, size.height * 0.7),
        width: size.width * 0.3,
        height: size.height * 0.2,
      ),
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}


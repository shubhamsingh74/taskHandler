import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class DrumItemDetailsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(41.4167, 49.7778);
    path_0.cubicTo(63.8611, 49.7778, 82.1389, 44.3644, 83.3333, 37.52);
    path_0.lineTo(83.3333, 19.6311);
    path_0.cubicTo(82.1389, 26.4756, 63.8889, 31.8889, 41.4167, 31.8889);
    path_0.cubicTo(30.4686, 32.1259, 19.5507, 30.5213, 9.02778, 27.1289);
    path_0.lineTo(9.02778, 20.9067);
    path_0.cubicTo(19.5535, 24.2781, 30.4714, 25.8617, 41.4167, 25.6044);
    path_0.cubicTo(63.8889, 25.6667, 82, 20.2533, 83.3333, 13.4711);
    path_0.cubicTo(82.7778, 2.86222, 57, 0, 41.6667, 0);
    path_0.cubicTo(26.3333, 0, 0, 2.89333, 0, 13.7822);
    path_0.lineTo(0, 84.0311);
    path_0.cubicTo(0, 94.8889, 26.1944, 97.8133, 41.6667, 97.8133);
    path_0.cubicTo(57.1389, 97.8133, 83.3333, 94.92, 83.3333, 84.0311);
    path_0.lineTo(83.3333, 67.8533);
    path_0.cubicTo(82.1389, 74.6667, 63.8889, 80.0178, 41.4167, 80.0178);
    path_0.cubicTo(30.4755, 80.3053, 19.5578, 78.7532, 9.02778, 75.4133);
    path_0.lineTo(9.02778, 69.1911);
    path_0.cubicTo(19.5578, 72.531, 30.4755, 74.0831, 41.4167, 73.7956);
    path_0.cubicTo(63.8889, 73.7956, 82.1389, 68.4444, 83.3333, 61.6311);
    path_0.lineTo(83.3333, 43.7422);
    path_0.cubicTo(82.1389, 50.5867, 63.8889, 56, 41.4167, 56);
    path_0.cubicTo(30.4714, 56.2572, 19.5535, 54.6737, 9.02778, 51.3022);
    path_0.lineTo(9.02778, 45.08);
    path_0.cubicTo(19.5535, 48.4514, 30.4714, 50.035, 41.4167, 49.7778);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.shader = ui.Gradient.linear(Offset(size.width * 0.4960321, 0),
        Offset(size.width * 0.4960321, size.height * 0.9980949), [
      const Color(0xff83BEED).withOpacity(1),
      const Color(0xff328BD2).withOpacity(0)
    ], [
      0,
      1
    ]);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

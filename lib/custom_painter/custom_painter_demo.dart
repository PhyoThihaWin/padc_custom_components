import 'package:flutter/material.dart';

class DemoCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    /// Draw Circle and Rect
    // var paint = Paint()
    //   ..strokeWidth = 2.0
    //   ..color = Colors.green
    //   ..style = PaintingStyle.fill;

    // var circlePaint = Paint()
    //   ..strokeWidth = 2.0
    //   ..color = Colors.white
    //   ..style = PaintingStyle.fill;
    //
    // canvas.drawRect(
    //     Rect.fromCircle(
    //         center: Offset(size.width / 2, size.height / 2), radius: 88),
    //     paint);
    // canvas.drawCircle(Offset(size.width / 2, size.height / 2), 88, circlePaint);

    /// Draw Lines
    var linePaint = Paint()
      ..strokeWidth = 2.0
      ..color = Colors.green
      ..style = PaintingStyle.fill;

    canvas.drawLine(Offset(0, 300), Offset(70, 0), linePaint);
    canvas.drawLine(Offset(70, 0), Offset(300, 0), linePaint);
    canvas.drawLine(Offset(300, 0), Offset(300, 300), linePaint);
    canvas.drawLine(Offset(300, 300), Offset(0, 300), linePaint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class CustomPainterDemo extends StatelessWidget {
  const CustomPainterDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomPaint(
          painter: DemoCustomPainter(),
          size: const Size(300, 300),
        ),
      ),
    );
  }
}

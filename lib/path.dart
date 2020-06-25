import 'package:flutter/material.dart';

class MyPath extends StatefulWidget {
  @override
  _MyPathState createState() => _MyPathState();
}

class _MyPathState extends State<MyPath> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: PathPainter(),
      child: Container(
        height: 300,
      ),
    );
  }
}

class PathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();

    double startingValue = 50;
    double endingValue = 50;

    path.moveTo(50 + startingValue, 150 + startingValue);
    path.lineTo(100 - endingValue, 200 - endingValue);

    path.moveTo(size.width - 50 - startingValue, 150 + startingValue);
    path.lineTo(size.width - 100 + endingValue, 200 - endingValue);

    path.moveTo(100 - startingValue, 600 + startingValue);
    path.lineTo(50 + endingValue, 650 - endingValue);

    path.moveTo(size.width - 100 + startingValue, 600 + startingValue);
    path.lineTo(size.width - 50 - endingValue, 650 - endingValue);

    paint
      ..color = Colors.teal
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
}

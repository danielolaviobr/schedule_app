import 'package:flutter/material.dart';

class Line extends StatefulWidget {
  @override
  _LineState createState() => _LineState();
}

class _LineState extends State<Line> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        // if (status == AnimationStatus.completed) {
        //   _controller.reverse();
        // }
        // else if (status == AnimationStatus.dismissed) {
        //   _controller.forward();
        // }
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FittedBox(
        child: Column(children: [
          CustomPaint(
            size: Size(MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height),
            //painter: DrawLine(_animation.value),
          ),
          RaisedButton(
            padding: EdgeInsets.all(20.0),
            onPressed: () => _controller.view,
            child: Text('Go'),
          )
        ]),
      ),
    );
  }
}

class DrawLine extends CustomPainter {
  final double startVal;
  final double endVal;

  DrawLine(this.startVal, this.endVal);
  @override
  // void paint(Canvas canvas, Size size) {
  //   Path path = Path();
  //   Paint paint = Paint();

  //   path.lineTo(0, size.height * 0.75);
  //   path.quadraticBezierTo(size.width * 0.10, size.height * 0.70,
  //       size.width * 0.17, size.height * 0.90);
  //   path.quadraticBezierTo(
  //       size.width * 0.20, size.height, size.width * 0.25, size.height * 0.90);
  //   path.quadraticBezierTo(size.width * 0.40, size.height * 0.40,
  //       size.width * 0.50, size.height * 0.70);
  //   path.quadraticBezierTo(size.width * 0.60, size.height * 0.85,
  //       size.width * 0.65, size.height * 0.65);
  //   path.quadraticBezierTo(
  //       size.width * 0.70, size.height * 0.90, size.width, 0);
  //   path.close();

  //   paint.color = Colors.blue;
  //   canvas.drawPath(path, paint);

  //   path = Path();
  //   path.lineTo(0, size.height * 0.50);
  //   path.quadraticBezierTo(size.width * 0.10, size.height * 0.80,
  //       size.width * 0.15, size.height * 0.60);
  //   path.quadraticBezierTo(size.width * 0.20, size.height * 0.45,
  //       size.width * 0.27, size.height * 0.60);
  //   path.quadraticBezierTo(
  //       size.width * 0.45, size.height, size.width * 0.50, size.height * 0.80);
  //   path.quadraticBezierTo(size.width * 0.55, size.height * 0.45,
  //       size.width * 0.75, size.height * 0.75);
  //   path.quadraticBezierTo(
  //       size.width * 0.85, size.height * 0.93, size.width, size.height * 0.60);
  //   path.lineTo(size.width, 0);
  //   path.close();

  //   paint.color = Colors.green;
  //   canvas.drawPath(path, paint);

  //   path = Path();
  //   path.lineTo(0, size.height * 0.75);
  //   path.quadraticBezierTo(size.width * 0.10, size.height * 0.55,
  //       size.width * 0.22, size.height * 0.70);
  //   path.quadraticBezierTo(size.width * 0.30, size.height * 0.90,
  //       size.width * 0.40, size.height * 0.75);
  //   path.quadraticBezierTo(size.width * 0.52, size.height * 0.50,
  //       size.width * 0.65, size.height * 0.70);
  //   path.quadraticBezierTo(
  //       size.width * 0.75, size.height * 0.85, size.width, size.height * 0.60);
  //   path.lineTo(size.width, 0);
  //   path.close();

  //   paint.color = Colors.red;
  //   canvas.drawPath(path, paint);
  // }
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.red
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    var path = Path();
    path.moveTo(0, size.height / 2);
    path.lineTo(size.width, size.height / 2);
    // path.moveTo(400, 100);
    // path.lineTo(300, 200);
    canvas.drawPath(path, paint);
    // canvas.drawLine(Offset(startVal * 100 + 300, startVal * 100 + 500),
    //     Offset(endVal * 100 + 300, endVal * 100 + 500), line);
    // canvas.drawLine(Offset(startVal * 80 + 500, startVal * 80 + 300),
    //     Offset(startVal * 80 + 500, startVal * 80 + 300), line2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

// ! -----------

class StaggerAnimation extends StatelessWidget {
  StaggerAnimation({Key key, this.controller})
      :

        // Each animation defined here transforms its value during the subset
        // of the controller's duration defined by the animation's interval.
        // For example the opacity animation transforms its value during
        // the first 10% of the controller's duration.

        startPoint = Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.0,
              0.500,
              curve: Curves.ease,
            ),
          ),
        ),
        endPoint = Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.300,
              0.800,
              curve: Curves.ease,
            ),
          ),
        ),
        startOpacity = Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.0,
              0.01,
              curve: Curves.linear,
            ),
          ),
        ),
        endOpacity = Tween<double>(
          begin: 1.0,
          end: 0.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.799,
              0.800,
              curve: Curves.linear,
            ),
          ),
        ),

        // ... Other tween definitions ...

        super(key: key);

  final Animation<double> controller;
  final Animation<double> startPoint;
  final Animation<double> endPoint;
  final Animation<double> startOpacity;
  final Animation<double> endOpacity;

  // This function is called each time the controller "ticks" a new frame.
  // When it runs, all of the animation's values will have been
  // updated to reflect the controller's current value.
  Widget _buildAnimation(BuildContext context, Widget child) {
    return FittedBox(
      child: Opacity(
        opacity: 1.0, //endOpacity.value,
        child: Opacity(
          opacity: 1.0, //startOpacity.value,
          child: CustomPaint(
            size: Size(MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height),
            painter: DrawLine(
              startPoint.value,
              endPoint.value,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }
}

class LineAnimation extends StatefulWidget {
  @override
  _LineAnimationState createState() => _LineAnimationState();
}

class _LineAnimationState extends State<LineAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FittedBox(
        child: Column(
          children: [
            StaggerAnimation(
              controller: _controller.view,
            ),
            RaisedButton(onPressed: () {
              if (_controller.isDismissed) {
                _controller.forward();
              } else {
                _controller.reset();
                _controller.forward();
              }
            }),
            //RaisedButton(onPressed: () => _controller.reverse())
          ],
        ),
      ),
    );
  }
}

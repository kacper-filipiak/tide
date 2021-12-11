import 'package:flutter/material.dart';
import 'dart:math';
import 'package:get/get.dart';
class AnimatedBackgroundDefaultPage extends StatefulWidget{
    @override
    _AnimatedBackgroundDefaultPageState createState() => _AnimatedBackgroundDefaultPageState();
}
class _AnimatedBackgroundDefaultPageState extends State<AnimatedBackgroundDefaultPage> with
SingleTickerProviderStateMixin{
    late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    )..repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) => CustomPaint(
        painter: OpenPainter(_controller.value),
      ),
    );
  }
}

class OpenPainter extends CustomPainter {
    OpenPainter(this.value);
    final double value;
    static double offset = 0.0;
@override
void paint(Canvas canvas, Size size) {
    offset+= 0.0001;
var paint = Paint()
  ..style = PaintingStyle.fill
  ..isAntiAlias = true
  ..color = Colors.blue;
List<Offset> wave = [];
wave.add(Offset(0.0,0.0));
wave.add(Offset(0.0,Get.height*0.02));
var accuracy = 200;
for(var t = 0; t < accuracy; t++){
    wave.add(Offset(t/accuracy*Get.width, 0.01 * (sin(t/10+offset*180)*Get.height + Get.height)));
}
wave.add(Offset(Get.width,Get.height*0.02));
wave.add(Offset(Get.width,0.0));
var path = Path()
        ..addPolygon(wave,true);
canvas.drawPath(path, paint);
}
 @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

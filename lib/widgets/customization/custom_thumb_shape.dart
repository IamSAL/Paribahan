import 'package:flutter/material.dart';

class CustomThumbShape implements RangeSliderThumbShape {
  const CustomThumbShape({
    this.radius = 15.0,
    this.ringColor = Colors.red,
  });

  /// Outer radius of thumb

  final double radius;

  /// Color of ring

  final Color ringColor;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(radius);
  }

  @override
  void paint(PaintingContext context, Offset center,
      {required Animation<double> activationAnimation,
      required Animation<double> enableAnimation,
      required bool isDiscrete,
      required bool isEnabled,
      required bool isOnTop,
      required TextDirection textDirection,
      required SliderThemeData sliderTheme,
      required Thumb thumb}) {
    final Canvas canvas = context.canvas;

    // To create a ring create outer circle and create an inner cicrle then
    // subtract inner circle from outer circle and you will get a ring shape
    // fillType = PathFillType.evenOdd will be used for that

    Path path = Path()
      ..addOval(Rect.fromCircle(center: center, radius: radius))
      ..addOval(Rect.fromCircle(center: center, radius: radius - 5))
      ..fillType = PathFillType.evenOdd;

    canvas.drawPath(path, Paint()..color = ringColor);
  }
}

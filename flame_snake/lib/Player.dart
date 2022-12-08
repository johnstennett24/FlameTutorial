import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Player extends PositionComponent {
  var paint = Paint()..color = Colors.white;

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawRect(size.toRect(), paint);
  }

  void move(Vector2 delta) {}
}

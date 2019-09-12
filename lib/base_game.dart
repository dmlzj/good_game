import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class BaseGame extends Game {
  Size screenSize;

  @override
  void render(Canvas canvas) {
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();
    bgPaint.color = Colors.amber;
    canvas.drawRect(bgRect, bgPaint);

    double screenCenterX = screenSize.width / 2;
    double screenCenterY = screenSize.height / 2;
    Rect boxRect = Rect.fromLTWH(
      screenCenterX - 75,
      screenCenterY - 75,
      150,
      150,
    );
    Paint boxPaint = Paint();
    boxPaint.color = Colors.red;
    canvas.drawRect(boxRect, boxPaint);
  }

  @override
  void update(double t) {
    // TODO: implement update
  }

  void resize(Size size) {
    screenSize = size;
    super.resize(size);
  }

  void onTapDown(TapDownDetails d) {
    print('test');
  }
}

import 'package:flame/sprite.dart';
import 'package:flutter/widgets.dart';
import 'package:good_game/fly_game.dart';

class Backyard {
  final FlyGame game;
  Sprite bgSprite;
  Rect bgRect;

  Backyard(this.game) {
    bgSprite = Sprite('bg/backyard.png');
    bgRect = Rect.fromLTWH(
      0,
      game.screenSize.height - game.titleSize * 23,
      game.titleSize *9,
      game.titleSize * 23,
    );
  }

  void render(Canvas c) {
    bgSprite.renderRect(c, bgRect);
  }

  void update(double t) {}
}

import 'package:flame/sprite.dart';
import 'package:flutter/widgets.dart';
import 'package:good_game/fly_game.dart';

class LostView {
  final FlyGame game;
  Rect rect;
  Sprite sprite;
  LostView(this.game) {
    rect = Rect.fromLTWH(
      game.titleSize,
      (game.screenSize.height / 2) - (game.titleSize * 5),
      game.titleSize * 7,
      game.titleSize * 5,
    );
    sprite = Sprite('bg/lose-splash.png');
  }

  void render(Canvas canvas) {
    sprite.renderRect(canvas, rect);
  }

  void update (double t) {}
}

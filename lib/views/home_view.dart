import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:good_game/fly_game.dart';

class HomeView {
  final FlyGame game;
  Rect titleRect;
  Sprite titleSprite;
  HomeView(this.game) {
    titleRect = Rect.fromLTWH(
      game.titleSize,
      (game.screenSize.height / 2) - (game.titleSize * 4),
      game.titleSize * 7,
      game.titleSize * 4,
    );
    titleSprite = Sprite('branding/title.png');
  }

  void render(Canvas canvas) {
    titleSprite.renderRect(canvas, titleRect);
  }

  void update(double t) {}
}

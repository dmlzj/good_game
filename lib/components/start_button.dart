import 'package:flame/sprite.dart';
import 'package:flutter/cupertino.dart';
import 'package:good_game/fly_game.dart';
import 'package:good_game/view.dart';

class StartButton {
  final FlyGame game;
  Rect rect;
  Sprite sprite;
  StartButton(this.game) {
    rect = Rect.fromLTWH(
      game.titleSize * 1.5,
      (game.screenSize.height * 0.75) - (game.titleSize * 1.5),
      game.titleSize * 6,
      game.titleSize * 3,
    );
    sprite = Sprite('ui/start-button.png');
  }

  void render(Canvas canvas) {
    sprite.renderRect(canvas, rect);
  }

  void update(double t) {}

  void onTapDown() {
    game.activeView = View.playing;
    game.spawner.start();
  }
}

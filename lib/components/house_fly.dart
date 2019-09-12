import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:good_game/components/fly.dart';
import 'package:good_game/fly_game.dart';

class HouseFly extends Fly {
  HouseFly(FlyGame game, double x, double y) : super(game) {
    flyRect = Rect.fromLTWH(x, y, game.titleSize * 1.5, game.titleSize * 1.5);
    flyingSprite = List<Sprite>();
    // flyingSprite.add(Sprite('bg/backyard.png'));
    flyingSprite.add(Sprite('flies/house-fly-1.png'));
    flyingSprite.add(Sprite('flies/house-fly-2.png'));
    deadSprite = Sprite('flies/house-fly-dead.png');
  }
}
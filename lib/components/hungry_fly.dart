import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:good_game/components/fly.dart';
import 'package:good_game/fly_game.dart';

class HungryFly extends Fly {
  HungryFly(FlyGame game, double x, double y) : super(game) {
    flyRect = Rect.fromLTWH(x, y, game.titleSize * 1.65, game.titleSize * 1.65);
    flyingSprite = List();
    flyingSprite.add(Sprite('flies/hungry-fly-1.png'));
    flyingSprite.add(Sprite('flies/hungry-fly-2.png'));
    deadSprite = Sprite('flies/hungry-fly-dead.png');
  }
  
}
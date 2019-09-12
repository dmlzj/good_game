import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:good_game/components/fly.dart';
import 'package:good_game/fly_game.dart';

class DroolerFly extends Fly {
  double get speed => game.titleSize * 1.5;
  DroolerFly(FlyGame game, double x, double y) : super(game) {
    flyRect = Rect.fromLTWH(x, y, game.titleSize * 1.5, game.titleSize * 1.5);
    flyingSprite = List();
    flyingSprite.add(Sprite('flies/drooler-fly-1.png'));
    flyingSprite.add(Sprite('flies/drooler-fly-2.png'));
    deadSprite = Sprite('flies/drooler-fly-dead.png');
  }
  
}
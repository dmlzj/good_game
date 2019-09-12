import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:good_game/fly_game.dart';

class Fly {
  final FlyGame game;
  Rect flyRect;
  Paint flyPaint;
  bool isDead = false;
  bool isOffScreen = false;
  List<Sprite> flyingSprite;
  Sprite deadSprite;
  double flyingSpriteIndex = 0;
  double get speed => game.titleSize * 3;
  Offset targetLocation;

  Fly(this.game) {
    setTargetLocation();
  }

  void render(Canvas c) {
    if (isDead) {
      deadSprite.renderRect(c, flyRect.inflate(2));
    } else {
      flyingSprite[(flyingSpriteIndex.toInt() < 2 ? flyingSpriteIndex.toInt() : 0)].renderRect(c, flyRect.inflate(2));
    }
    // c.drawRect(flyRect, flyPaint);
  }

  void update(double t) {
    if (isDead) {
      flyRect = flyRect.translate(0, game.titleSize *12 * t);
      if (flyRect.top  > game.screenSize.height) {
        isOffScreen = true;
      }
    } else {
      flyingSpriteIndex += 30 * t;
      if (flyingSpriteIndex >= 2) {
        flyingSpriteIndex -= 2;
      }
    }

    double stepDistance = speed * t;
    Offset toTarget = targetLocation - Offset(flyRect.left, flyRect.top);
    if (stepDistance < toTarget.distance) {
      Offset stepToTarget = Offset.fromDirection(toTarget.direction, stepDistance);
      flyRect = flyRect.shift(stepToTarget);
    } else {
      flyRect = flyRect.shift(toTarget);
      setTargetLocation();
    }
  }
  
  void setTargetLocation() {
    double x = game.rnd.nextDouble() * (game.screenSize.width - (game.titleSize * 2.025));
    double y = game.rnd.nextDouble() * (game.screenSize.height -(game.titleSize * 2.025));
    targetLocation = Offset(x, y);
  }

  void onTapDown() {
    isDead = true;
    // game.spawnFly();
  }
}

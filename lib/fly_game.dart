import 'dart:math';
import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:good_game/components/agile_fly.dart';
import 'package:good_game/components/backyard.dart';
import 'package:good_game/components/drooler_fly.dart';
import 'package:good_game/components/fly.dart';
import 'package:good_game/components/house_fly.dart';
import 'package:good_game/components/hungry_fly.dart';
import 'package:good_game/components/macho_fly.dart';
import 'package:good_game/components/start_button.dart';
import 'package:good_game/view.dart';
import 'package:good_game/views/home_view.dart';

class FlyGame extends Game {
  Size screenSize;
  double titleSize;
  // bool hasWon = false;
  List<Fly> files;
  Random rnd;
  Backyard background;

  View activeView = View.home;
  HomeView homeView;
  StartButton startButton;

  FlyGame() {
    initialize();
  }

  void initialize() async {
    files = List<Fly>();
    rnd = Random();
    resize(await Flame.util.initialDimensions());

    background = Backyard(this);
    homeView = HomeView(this);
    startButton = StartButton(this);
    spawnFly();
  }

  void spawnFly() {
    double x = rnd.nextDouble() * (screenSize.width - titleSize * 2.025);
    double y = rnd.nextDouble() * (screenSize.height - titleSize * 2.025);

    switch (rnd.nextInt(5)) {
      case 0:
        files.add(HouseFly(this, x, y));
        break;
      case 1:
        files.add(DroolerFly(this, x, y));
        break;
      case 2:
        files.add(AgileFly(this, x, y));
        break;
      case 3:
        files.add(MachoFly(this, x, y));
        break;
      case 4:
        files.add(HungryFly(this, x, y));
        break;
      default:
    }
  }

  @override
  void render(Canvas canvas) {
    background.render(canvas);
    files.forEach((Fly fly) => fly.render(canvas));
    if (activeView == View.home) homeView.render(canvas);
    if (activeView == View.home || activeView == View.lost) {
      startButton.render(canvas);
    }
    // double screenCenterX = screenSize.width / 2;
    // double screenCenterY = screenSize.height / 2;
    // Rect boxRect = Rect.fromLTWH(
    //   screenCenterX - 75,
    //   screenCenterY - 75,
    //   150,
    //   150,
    // );
    // Paint boxPaint = Paint();
    // if (hasWon) {
    //   boxPaint.color = Colors.red;
    // } else {
    //   boxPaint.color = Colors.black;
    // }

    // canvas.drawRect(boxRect, boxPaint);
  }

  @override
  void update(double t) {
    files.forEach((Fly fly) => fly.update(t));
    files.removeWhere((Fly fly) => fly.isOffScreen);
  }

  void resize(Size size) {
    screenSize = size;
    titleSize = screenSize.width / 9;
    super.resize(size);
  }

  void onTapDown(TapDownDetails d) {
    bool isHandled = false;
    Fly nowFly;

    if (!isHandled && startButton.rect.contains(d.globalPosition)) {
      if (activeView == View.home || activeView == View.lost) {
        startButton.onTapDown();
        isHandled = true;
      }
    }
    if (!isHandled) {
      bool didHitAFly = false;
      files.forEach((Fly fly) {
        if (fly.flyRect.contains(d.globalPosition)) {
          nowFly = fly;
          // files.remove(fly);
        }
      });
      if (nowFly != null) {
        // print('111');
        nowFly.onTapDown();
        isHandled = true;
        didHitAFly = true;
      }
      if (activeView == View.playing && !didHitAFly) {
        activeView = View.lost;
      }
    }
  }
}

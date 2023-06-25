import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:space_game2/utilits/global_vars.dart';

import 'entity.dart';

class Player extends Entity {
  Player() : super('player') {
    x = 150;
    y = 150;
  }

  bool isMoveRight = false;
  bool isMoveLeft = false;
  double _degree = 0;
  double _angle = 0;
  double _speed = 3;

  @override
  Widget build() {
    return Positioned(
      top: y,
      left: x,
      child: visible
          ? Transform.rotate(
              angle: _angle,
              child: sprites.first,
            )
          : const SizedBox(),
    );
    // throw UnimplementedError();
  }

  @override
  void move() {
    if (isMoveLeft) _degree += 5;
    if (isMoveRight) _degree -= 5;
    _angle = (_degree * 3.14) / 180;

    isMoveLeft = false;
    isMoveRight = false;

    x += sin(_degree * 0.0175) * _speed;
    y -= cos(_degree * 0.0175) * _speed;

    if (x < 0) x = 0;
    if (y < 0) y = 0;
    if (x > GlobalVars.screenWidth - 50) x = GlobalVars.screenWidth - 50;
    if (y > GlobalVars.screenHeight - 60) y = GlobalVars.screenHeight - 60;
  }

  @override
  void update() {
    move();
  }
}

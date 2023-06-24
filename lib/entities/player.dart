import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'entity.dart';

class Player extends Entity {
  Player() : super('player') {
    x = 50;
    y = 150;
  }

  @override
  Widget build() {
    return Positioned(
      top: y,
      left: x,
      child: visible ? sprites.first : const SizedBox(),
    );
    // throw UnimplementedError();
  }

  @override
  void move() {
    x++;
    if (x > 600) x = 0;
  }

  @override
  void update() {
    move();
  }
}

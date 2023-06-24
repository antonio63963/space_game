import 'package:flutter/material.dart';
import 'package:space_game2/entities/player.dart';
import 'package:space_game2/scenes/app_scene.dart';

class GameScene implements AppScene {
  final Player _player = Player();

  @override
  Widget buildScene() {
    return Stack(children: [
      _player.build(),
    ]);
  }

  @override
  void update() {
    _player.update();
  }
}

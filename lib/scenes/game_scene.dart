import 'package:flutter/material.dart';
import 'package:space_game2/entities/player.dart';
import 'package:space_game2/scenes/app_scene.dart';
import 'package:space_game2/utilits/global_vars.dart';

class GameScene implements AppScene {
  final Player _player = Player();
  double _startGlobalPosition = 0;

  void _onPanStart(DragStartDetails details) {
    _startGlobalPosition = details.globalPosition.dx;
    print('Start: $_startGlobalPosition');
  }

  void _onPanUpdate(DragUpdateDetails details) {
    double updateGlobalPosition = details.globalPosition.dx;
    if (updateGlobalPosition > _startGlobalPosition + 50) {
      _player.isMoveRight = true;
    }
    if (updateGlobalPosition < _startGlobalPosition -50) {
      _player.isMoveLeft = true;
    }
  }

  @override
  Widget buildScene() {
    return Stack(children: [
      _player.build(),
      Positioned(
        top: 0,
        left: 0,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green),
          ),
          width: GlobalVars.screenWidth / 2,
          height: GlobalVars.screenHeight,
          child: GestureDetector(
            onPanStart: _onPanStart,
            onPanUpdate: _onPanUpdate,
          ),
        ),
      ),
    ]);
  }

  @override
  void update() {
    _player.update();
  }
}

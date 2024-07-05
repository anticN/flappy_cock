import 'dart:math';

import 'package:flame/components.dart';
import 'package:flappy_cock/components/pipe.dart';
import 'package:flappy_cock/game/configuration.dart';
import 'package:flappy_cock/game/flappy_cock_game.dart';
import 'package:flappy_cock/game/pipe_position.dart';
import 'package:flutter/foundation.dart';

class PipeCombo extends PositionComponent with HasGameRef<FlappyCockGame>{
  PipeCombo();

  final _random = Random();

  @override
  Future<void> onLoad() async {
    position.x = gameRef.size.x - 15;

    final heightMinusGround = gameRef.size.y - Config.groundHeight;
    final space = 100 + _random.nextDouble() * (heightMinusGround / 4);
    final centerY = space + _random.nextDouble() * (heightMinusGround - space);

    addAll([
      Pipe(pipePosition: PipePosition.top, height: centerY - space / 2),
      Pipe(pipePosition: PipePosition.bottom, 
        height: heightMinusGround - (centerY + space / 2)),
    ]);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= Config.gameSpeed * dt;

    if (position.x < -35) {
      removeFromParent();
      updateScore();
    }

    if (gameRef.isHit) {
      removeFromParent();
      gameRef.isHit = false;
    }
  }

  void updateScore() {
    gameRef.cock.score += 1;
  }

}
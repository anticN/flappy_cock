import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/timer.dart';
import 'package:flappy_cock/components/background.dart';
import 'package:flappy_cock/components/ground.dart';
import 'package:flappy_cock/components/pipe_combo.dart';
import 'package:flappy_cock/components/player.dart';
import 'package:flappy_cock/game/configuration.dart';
import 'package:flutter/material.dart';

class FlappyCockGame extends FlameGame with TapDetector, HasCollisionDetection{
  FlappyCockGame();
  
  late Player cock;
  late TextComponent score;
  Timer interval = Timer(Config.pipeInterval, repeat: true);
  bool isHit = false;

  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Ground(),
      cock = Player(),
      score = buildScore(),
    ]);

    interval.onTick = () => add(PipeCombo());
  }

  TextComponent buildScore() {
    return TextComponent(
      text: 'Score: 0',
      position: Vector2(size.x /2, size.y / 2 * 0.2),
      anchor: Anchor.center,
      textRenderer: TextPaint(
        style: const TextStyle(
          fontSize: 40, fontWeight: FontWeight.bold
        )
        )
      );
  }

  @override
  void onTap() {
    super.onTap();
    cock.fly();
  }

  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);

    score.text = 'Score: ${cock.score}';
  }

}
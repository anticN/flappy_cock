import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flappy_cock/game/assets.dart';
import 'package:flappy_cock/game/cock_movement.dart';
import 'package:flappy_cock/game/configuration.dart';
import 'package:flappy_cock/game/flappy_cock_game.dart';
import 'package:flutter/widgets.dart';

class Player extends SpriteGroupComponent<CockMovement> with HasGameRef<FlappyCockGame> {
  Player();

  @override
  Future<void> onLoad() async {
    final cock = await gameRef.loadSprite(Assets.cock);
    final cockUp = await gameRef.loadSprite(Assets.cockUp);
    final cockDown = await gameRef.loadSprite(Assets.cockDown);

    size = Vector2(60, 50);
    position = Vector2(50, gameRef.size.y/2 - size.y / 2);
    current = CockMovement.middle;
    sprites = {
      CockMovement.middle: cock,
      CockMovement.up: cockUp,
      CockMovement.down: cockDown
    };
  }

  void fly() {
    add(
      MoveByEffect(
        Vector2(0, Config.gravity), EffectController(duration: 0.2, curve: Curves.decelerate),
        onComplete: () => current = CockMovement.down,)
    );
    current = CockMovement.up;
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.y += Config.cockVelocity * dt;
  }
}
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flappy_cock/game/assets.dart';
import 'package:flappy_cock/game/cock_movement.dart';
import 'package:flappy_cock/game/configuration.dart';
import 'package:flappy_cock/game/flappy_cock_game.dart';
import 'package:flutter/widgets.dart';
import 'package:vibration/vibration.dart';

class Player extends SpriteGroupComponent<CockMovement> with HasGameRef<FlappyCockGame>, CollisionCallbacks {
  Player();

  int score = 0;

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

    add(CircleHitbox());
  }

  void fly() {
    add(
      MoveByEffect(
        Vector2(0, Config.gravity), EffectController(duration: 0.2, curve: Curves.decelerate),
        onComplete: () => current = CockMovement.down,)
    );
    current = CockMovement.up;
    FlameAudio.play(Assets.testAudio);
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPnts,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPnts, other);
    gameOver();
  }

  void reset() {
    position = Vector2(50, gameRef.size.y / 2 - size.y / 2);
    score = 0;
  }

  void gameOver() {
    gameRef.overlays.add('gameOver');
    gameRef.pauseEngine();
    Vibration.vibrate(duration: 250);
    game.isHit = true;
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.y += Config.cockVelocity * dt;
    if (position.y < 1) {
      gameOver();
    }
  }
}
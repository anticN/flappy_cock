import 'package:flame/components.dart';
import 'package:flappy_cock/game/assets.dart';
import 'package:flappy_cock/game/cock_movement.dart';
import 'package:flappy_cock/game/flappy_cock_game.dart';

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
}
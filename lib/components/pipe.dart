import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/flame.dart';
import 'package:flappy_cock/game/assets.dart';
import 'package:flappy_cock/game/configuration.dart';
import 'package:flappy_cock/game/flappy_cock_game.dart';
import 'package:flappy_cock/game/pipe_position.dart';

class Pipe extends SpriteComponent with HasGameRef<FlappyCockGame>{
  Pipe({
    required this.pipePosition,
    required this.height,
  });

  @override
  final double height;
  final PipePosition pipePosition;

  Future<void> onLoad() async {
    final pipe = await Flame.images.load(Assets.yellowPipe);
    final flippedPipe = await Flame.images.load(Assets.flippedYellowPipe);
    size = Vector2(50, height);

    switch (pipePosition) {
      case PipePosition.top:
        position.y = 0;
        sprite = Sprite(flippedPipe);
        break;
      case PipePosition.bottom:
        position.y = gameRef.size.y - size.y - Config.groundHeight;
        sprite = Sprite(pipe);
        break;
    }

    add(RectangleHitbox());
  }
}
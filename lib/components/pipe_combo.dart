import 'package:flame/components.dart';
import 'package:flappy_cock/components/pipe.dart';
import 'package:flappy_cock/game/configuration.dart';
import 'package:flappy_cock/game/flappy_cock_game.dart';
import 'package:flappy_cock/game/pipe_position.dart';

class PipeCombo extends PositionComponent with HasGameRef<FlappyCockGame>{
  PipeCombo();

  @override
  Future<void> onLoad() async {
    position.x = gameRef.size.x - 40;

    addAll([
      Pipe(pipePosition: PipePosition.top, height: 100),
      Pipe(pipePosition: PipePosition.bottom, height: 200),
    ]);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= Config.gameSpeed * dt;
  }

}
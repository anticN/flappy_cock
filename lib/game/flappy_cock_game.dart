

import 'package:flame/game.dart';
import 'package:flame/timer.dart';
import 'package:flappy_cock/components/background.dart';
import 'package:flappy_cock/components/ground.dart';
import 'package:flappy_cock/components/pipe_combo.dart';
import 'package:flappy_cock/components/player.dart';
import 'package:flappy_cock/game/configuration.dart';

class FlappyCockGame extends FlameGame {
  FlappyCockGame();
  
  late Player cock;
  Timer interval = Timer(Config.pipeInterval, repeat: true);

  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Ground(),
      cock = Player(),
    ]);

    interval.onTick = () => add(PipeCombo());
  }

  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);
  }

}
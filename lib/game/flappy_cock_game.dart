import 'package:flame/game.dart';
import 'package:flappy_cock/components/background.dart';
import 'package:flappy_cock/components/ground.dart';
import 'package:flappy_cock/components/player.dart';

class FlappyCockGame extends FlameGame {
  late Player cock;
  
  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Ground(),
      cock = Player(),
    ]);
  }
}
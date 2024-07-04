import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappy_cock/game/assets.dart';

class Background extends SpriteComponent with HasGameRef {
  Background();

  @override
  Future<void> onLoad() async {
    final background = await Flame.images.load(Assets.background);
    size = gameRef.size;
    sprite = Sprite(background);  
  }
}
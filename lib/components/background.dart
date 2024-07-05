import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappy_cock/game/assets.dart';
import 'package:light_sensor/light_sensor.dart';

class Background extends SpriteComponent with HasGameRef {
  Background();

  @override
  Future<void> onLoad() async {
    await _updateBackgroundBasedOnLux();

    LightSensor.luxStream().listen((lux) async {
      await _updateBackgroundBasedOnLux();
    });
  }

  Future<void> _updateBackgroundBasedOnLux() async {
    final lux = await LightSensor.luxStream().first;
    if (lux > 60) {
      final background = await Flame.images.load(Assets.background);
      sprite = Sprite(background);
    } else {
      final background = await Flame.images.load(Assets.nightBackground);
      sprite = Sprite(background);
    }
    size = gameRef.size;
  }
}
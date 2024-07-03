import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class FlappyGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    final background = await loadSprite('background.jpg');
    final backgroundComponent = SpriteComponent(sprite: background, size: size);
    add(backgroundComponent);
    addMenuButtons();
  }

  void addMenuButtons() {
    final playButton = TapComponent(
        onTap: startGame,
        textComponent: TextComponent(
        text: 'Play',
      )
    )..anchor = Anchor.center
    ..position = Vector2(size.x / 2.5, size.y / 2 - 120);
    add(playButton);

    final settingsButton = TapComponent(
        onTap: openSettings,
        textComponent: TextComponent(
        text: 'Settings',
      )
    )..anchor = Anchor.center
    ..position = Vector2(size.x / 2.5, size.y / 2 - 60);
    add(settingsButton);

    final quitButton = TapComponent(
        onTap: quitGame,
        textComponent: TextComponent(
        text: 'Quit',
      )
    )..anchor = Anchor.center
    ..position = Vector2(size.x / 2.5, size.y / 2 + 10);
    add(quitButton);
  }

  void startGame() {
    // Transition to the game screen
  }

  void openSettings() {
    // Open settings menu
  }

  void quitGame() {
    // Close the app or return to the previous screen
  } 
}

class TapComponent extends PositionComponent {
  final Function onTap;
  final TextComponent textComponent;

  TapComponent({required this.onTap, required this.textComponent}) {
    add(textComponent);
  }
}
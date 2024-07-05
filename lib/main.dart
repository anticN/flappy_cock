import 'package:flame/game.dart';
import 'package:flappy_cock/game/flappy_cock_game.dart';
import 'package:flappy_cock/pages/game_over_page.dart';
import 'package:flappy_cock/pages/start_page.dart';
import 'package:flutter/material.dart';


void main() {
  final game = FlappyCockGame();

  runApp(GameWidget(
    game: game,
    initialActiveOverlays: const [StartPage.id],
    overlayBuilderMap: {
      'startPage': (context, _) => StartPage(game: game),
      'gameOver': (context, _) => GameOverPage(game: game),
    },
  ));
}
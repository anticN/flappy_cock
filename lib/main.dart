import 'package:flame/game.dart';
import 'package:flappy_cock/game/flappy_cock_game.dart';
import 'package:flutter/material.dart';


void main() {
  final game = FlappyCockGame();

  runApp(GameWidget(game: game));
}
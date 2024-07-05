import 'package:flappy_cock/game/assets.dart';
import 'package:flappy_cock/game/flappy_cock_game.dart';
import 'package:flutter/material.dart';

class GameOverPage extends StatelessWidget {
  final FlappyCockGame game;
  static const String id = 'gameOver';

  const GameOverPage({super.key, required this.game});
  
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black38,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(Assets.gameOver),
          const SizedBox(height: 20,),
          ElevatedButton(
            onPressed: onRestart, 
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            child: const Text('Restart', style: TextStyle(fontSize: 20),))
        ],
      ),
    );
  }

  void onRestart() {
    game.cock.reset();
    game.overlays.remove('gameOver');
    game.resumeEngine();
  }  
}
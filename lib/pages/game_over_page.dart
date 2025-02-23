import 'package:flame/components.dart';
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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 250, width: 3000,),
          Text(
            'Score: ${game.cock.score}',
            style: const TextStyle(
              fontSize: 60,
              color: Colors.white
            ),
          ),
          Text(
            'Game Over!',
            style: const TextStyle(
              fontSize: 50,
              color: Colors.red
            ),
          ),
          const SizedBox(height: 20,),
          ElevatedButton(
            onPressed: onRestart, 
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            child: const Text('Restart', style: TextStyle(fontSize: 20),)),

          const SizedBox(height: 20,),
          ElevatedButton(
            onPressed: onHome, 
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            child: const Text('Home Screen', style: TextStyle(fontSize: 20),))
        ],
      ),
    );
  }

  void onRestart() {
    game.cock.reset();
    game.overlays.remove('gameOver');
    game.resumeEngine();
  }  

  void onHome() {
    game.cock.reset();
    game.pauseEngine();
    game.overlays.remove('gameOver');
    game.overlays.add('startPage');
  }
}
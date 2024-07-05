import 'package:flappy_cock/game/assets.dart';
import 'package:flappy_cock/game/flappy_cock_game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StartPage extends StatelessWidget {
  final FlappyCockGame game;
  static const String id = 'startPage';

  const StartPage({Key? key, required this.game}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    game.pauseEngine();

    return Scaffold(
      body: GestureDetector(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.startPageBackground),
              fit: BoxFit.cover),
          ),

          child: Column(children: [
            const Text(
              'Flappy Cock',
              style: TextStyle(
                fontSize: 50,
                color: Colors.blue
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                game.overlays.remove('startPage');
                game.resumeEngine();
              },
              child: const Text('Play'),
            ),

            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              },
              child: const Text('Quit'),
            ),
            
          ],),
        ),
      ),
    );
  }
}
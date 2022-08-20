import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:pac/main.dart';
import '../screens/game.dart';

class MyGameController extends GameComponent {
  bool endGame = false;
  bool gameOver = false;

  final stage;
  MyGameController(this.stage);

  @override
  void update(double dt) {
    // check Game victory
    if (checkInterval('end game', 500, dt)) {
      if (moedas == 970 && !endGame) {
        endGame = true;
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) => AlertDialog(
              actions: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //Icon(icon),
                      const Text(
                        'VOCÊ VENCEU!',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        '',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                _goStage(stage);
                                moedas = 0;
                                endGame = false;
                              },
                              child: const Text('Jogar novamente')),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ));
      }

      if (gameRef.player?.isDead == true && !gameOver) {
        gameOver = true;
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) => AlertDialog(
              actions: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //Icon(icon),
                      const Text(
                        'GAME OVER!',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        '',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                _goStage(stage);
                                moedas = 0;
                              },
                              child: const Text('Tentar novamente')),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ));
      }
    }

    //check GameOver


    super.update(dt);
  }

  void _goStage(int newStage) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) {
      return Game(stage: newStage);
    }), (route) => false);
  }
}

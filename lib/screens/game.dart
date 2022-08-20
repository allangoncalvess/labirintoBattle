import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:pac/characters/playerHero.dart';
import 'package:pac/characters/villain.dart';
import 'package:pac/controllers/game_controller.dart';
import 'package:pac/interface/player_interface.dart';
import 'package:pac/items/moeda.dart';
import '../items/life.dart';
import '../main.dart';

class Game extends StatefulWidget {
  final int stage;
  const Game({Key? key, this.stage = 1}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  Widget build(BuildContext context) {
    return BonfireTiledWidget(
      overlayBuilderMap: {
        PlayerInterface.overlayKey:((context, game) => PlayerInterface(game: game)),
      },
      initialActiveOverlays: const [
        PlayerInterface.overlayKey,
      ],
      background: BackgroundColorGame(Colors.green),
      joystick: Joystick(
          keyboardConfig: KeyboardConfig(
            keyboardDirectionalType: KeyboardDirectionalType.wasdAndArrows,
          ),
          directional: JoystickDirectional(
            //color: Colors.black,
            size: 70, // directional control size
            isFixed: false,
          ),
          actions: [
            JoystickAction(
              //sprite: Sprite.load('action.png'), // the action image
              //spriteBackgroundDirection: Sprite.load('action.png'),
              actionId: 1,
              margin: const EdgeInsets.all(60),
            ),
          ]
      ),
      map: TiledWorldMap('map/forestmap.json',
        //add moedas
        objectsBuilder: {
          'moeda': (properties)=>Moeda(properties.position),
        },
        forceTileSize: Size(tileSize, tileSize),
      ),
      player: PlayerHero(Vector2(18*tileSize, 14*tileSize)),
      cameraConfig: CameraConfig(
        moveOnlyMapArea: true,
        zoom: 1,
      ),
      components: [
        MyGameController(widget.stage),

        Life(Vector2(tileSize*8.6, tileSize*20)),
        Life(Vector2(tileSize*24.6, tileSize*25)),
        Life(Vector2(tileSize*19.1, tileSize*30)),

        Villain(Vector2(1 * tileSize, 23 * tileSize)),
        Villain(Vector2(9 * tileSize, 11 * tileSize)),
        Villain(Vector2(12 * tileSize, 35 * tileSize)),
        Villain(Vector2(25 * tileSize, 23 * tileSize)),
        Villain(Vector2(9 * tileSize, 20 * tileSize)),
        Villain(Vector2(20 * tileSize, 25 * tileSize)),
        Villain(Vector2(6 * tileSize, 23 * tileSize)),
        Villain(Vector2(25 * tileSize, 17 * tileSize)),
        Villain(Vector2(6 * tileSize, 35 * tileSize)),
        Villain(Vector2(1 * tileSize, 32 * tileSize)),

      ],
      //showCollisionArea: true,
    );
  }
}


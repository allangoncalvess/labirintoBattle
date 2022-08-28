import 'package:bonfire/bonfire.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:pac/animations/add_arrows_sprite_sheet.dart';
import 'package:pac/characters/master_a.dart';
import 'package:pac/characters/playerHero.dart';
import 'package:pac/characters/villain.dart';
import 'package:pac/controllers/game_controller.dart';
import 'package:pac/interface/player_interface.dart';
import 'package:pac/items/add_arrows.dart';
import '../items/coins.dart';
import '../items/life.dart';
import '../main.dart';

final audioBackground = AudioPlayer();
String mapStage = '';
double zoomConfigure = 1;

class Game extends StatefulWidget {
  final int stage;
  const Game({Key? key, this.stage = 1}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> with WidgetsBindingObserver {

  List<GameComponent> enimies = [];

  @override
  void initState() {
    switch( widget.stage ){

      case 1:
        mapStage = 'map/stage_a.json';
      break;

      case 2:
        mapStage = 'map/stage_a_master.json';
      break;

      case 3:
        mapStage = 'map/stage_b_.json';
        break;

    }
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    audioBackground.stop();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print('state = $state');
  }

  @override
  Widget build(BuildContext context) {
    _audioBackground();
    return BonfireTiledWidget(

      overlayBuilderMap: {
        PlayerInterface.overlayKey:((context, game) => PlayerInterface(game: game)),
      },
      initialActiveOverlays: const [
        PlayerInterface.overlayKey,
      ],
      background: BackgroundColorGame(Color(0xff639BFF)),
      joystick: Joystick(
          keyboardConfig: KeyboardConfig(
            keyboardDirectionalType: KeyboardDirectionalType.wasdAndArrows,
          ),
          directional: JoystickDirectional(
            spriteKnobDirectional: Sprite.load('joystick/joystick_knob.png'),
            spriteBackgroundDirectional: Sprite.load('joystick/joystick_background.png'),
            //size: 120, // directional control size
            isFixed: false,
          ),
          actions: [
            JoystickAction(
              sprite: Sprite.load('joystick/joystick_atack.png'), // the action image
              spriteBackgroundDirection: Sprite.load('joystick/joystick_atack.png'),
              actionId: 1,
              size: 80,
              margin: const EdgeInsets.fromLTRB(0, 0, 40, 60),

            ),
            JoystickAction(
              sprite: Sprite.load('joystick/joystick_atack_range.png'),
              actionId: 2,
              size: 70,
              margin: const EdgeInsets.fromLTRB(0, 0, 130, 60)
            ),

          ]
      ),
      map: TiledWorldMap(mapStage,
        objectsBuilder: {
          'coins': (properties)=>Coins(properties.position),
          'addArrow': (properties)=>AddArrows(properties.position),
          'life': (properties)=>Life(properties.position),
          'enemy': (properties)=>Villain(properties.position),
          'master_a': (properties)=>MasterA(properties.position),
        },
        forceTileSize: Size(tileSize, tileSize),
      ),
      player: PlayerHero(Vector2(18*tileSize, 14*tileSize)),
      cameraConfig: CameraConfig(
        moveOnlyMapArea: true,
        zoom: zoomConfigure,
      ),
      components: [
        MyGameController(widget.stage),
      ],
      //showCollisionArea: true,
    );
  }

  void _audioBackground(){
    //FlameAudio.bgm.initialize();
    //FlameAudio.bgm.play('Battleship.ogg');
    // await audioBackground.setAsset('assets/audio/Battleship.ogg');
    // await audioBackground.setVolume(0.5);
    // await audioBackground.setLoopMode(LoopMode.one);
    // await audioBackground.play();
  }

}


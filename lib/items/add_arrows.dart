import 'package:bonfire/bonfire.dart';
import 'package:just_audio/just_audio.dart';
import 'package:pac/animations/add_arrows_sprite_sheet.dart';
import 'package:pac/animations/life_sprite_sheet.dart';
import '../main.dart';

final audioLife = AudioPlayer();
late final BonfireGame game;

class AddArrows extends GameDecoration with Sensor{

  AddArrows(Vector2 position)
      :super.withAnimation(
    animation: AddArrowsSpriteSheet().image,
    position: position,
    size: Vector2(32, 24),
  ){
    setupSensorArea(
        areaSensor: [
          CollisionArea.rectangle(
            size: Vector2(32, 24),
          ),
        ]
    );
  }

  @override
  void onContact(GameComponent component) {
    if(component.toString() == "Instance of 'PlayerHero'" ){
      removeFromParent();
      arrowPlayer = arrowPlayer + 5;
      _audioLife();
    }
  }
}

Future<void> _audioLife () async {
  await audioLife.setAsset('assets/audio/life.wav');
  await audioLife.play();
}
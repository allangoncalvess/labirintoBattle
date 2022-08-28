import 'package:bonfire/bonfire.dart';
import 'package:just_audio/just_audio.dart';
import 'package:pac/animations/life_sprite_sheet.dart';
import '../main.dart';

final audioLife = AudioPlayer();
late final BonfireGame game;

class Life extends GameDecoration with Sensor{

  Life(Vector2 position)
      :super.withAnimation(
    animation: LifeSpriteSheet().image,
    position: position,
    size: Vector2(20, 20),
  ){
    setupSensorArea(
        areaSensor: [
          CollisionArea.rectangle(
            size: Vector2(16, 16),
          ),
        ]
    );
  }

  @override
  void onContact(GameComponent component) {
    if(component.toString() == "Instance of 'PlayerHero'" ){
      removeFromParent();
      _audioLife();
    }
  }
}

Future<void> _audioLife () async {
  await audioLife.setAsset('assets/audio/life.wav');
  await audioLife.play();
}
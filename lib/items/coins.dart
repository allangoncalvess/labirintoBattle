import 'package:bonfire/bonfire.dart';
import 'package:just_audio/just_audio.dart';
import 'package:pac/animations/coins_sprite_sheet.dart';
import '../main.dart';

final audioCoins = AudioPlayer();

class Coins extends GameDecoration with Sensor{
  Coins(Vector2 position)
      :super.withAnimation(
      animation: CoinsSpriteSheet().image,
      position: position,
      size: Vector2(16, 16),
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
      coins = coins + 10;
      _audioCoins();
    }
  }
}

Future<void> _audioCoins () async {
  await audioCoins.setAsset('assets/audio/coins.wav');
  await audioCoins.setVolume(0.4);
  await audioCoins.play();
}
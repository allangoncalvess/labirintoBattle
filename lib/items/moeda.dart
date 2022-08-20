import 'package:bonfire/bonfire.dart';
import 'package:pac/main.dart';

class Moeda extends SimpleEnemy with Sensor {
  Moeda(Vector2 position)
      : super(
      position: position,
      //required
      size: Vector2(16.0, 16.0),
      //required
      life: 1,
      speed: 20,
      initDirection: Direction.down,
      animation: SimpleDirectionAnimation(
        idleLeft: image,
        idleRight: image, //required
        runLeft: image,
        runRight: image,
      )
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
      moedas = moedas + 10;
    }
  }
}




Future<SpriteAnimation> get image => SpriteAnimation.load('diversos.png',
  SpriteAnimationData.sequenced(
    amount: 4,
    stepTime: 0.15,
    textureSize: Vector2(8, 8),
    texturePosition: Vector2(tileSize * 18, tileSize * 17),
  ),
);




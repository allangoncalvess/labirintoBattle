import 'package:bonfire/bonfire.dart';
import 'package:pac/main.dart';
import '../characters/playerHero.dart';

class Life extends SimpleEnemy with ObjectCollision{
  Life(Vector2 position)
      : super(
      position: position, //required
      size: Vector2(32.0, 32.0), //required
      life: 500,
      speed: 20,
      initDirection: Direction.down,
      animation: SimpleDirectionAnimation(
        idleLeft: image,
        idleRight: image, //required
        runLeft: image,
        runRight: image,
      )
  ){
    setupCollision(
      CollisionConfig(
        enable: true,
        collisions: [ //required
          CollisionArea.rectangle(
            size: Vector2(16,16),
            align: Vector2(10,10),
          ),
        ],
      ),
    );
  }

  @override
  void update(double dt) {
    this.seeComponentType<PlayerHero>(
        observed: (player) {
          removeFromParent();
          lifePlayer = 100;

    },
      radiusVision: tileSize,
    );
    super.update(dt);
  }

  @override
  bool onCollision(GameComponent component, bool active) {
    if (component.toString() == "Instance of 'Villain'" ){

    } else if (component.toString() == "Instance of 'PlayerHero'") {
    }
    return super.onCollision(component, active);
  }

  @override
  void die() {
    super.die();
  }

}

Future<SpriteAnimation> get image => SpriteAnimation.load('diversos.png',
  SpriteAnimationData.sequenced(
    amount: 1,
    stepTime: 0.50,
    textureSize: Vector2(16, 16),
    texturePosition: Vector2(20*tileSize, 14*tileSize),
  ),
);
import 'package:bonfire/bonfire.dart';
import 'package:pac/animations/hero_sprite_sheet.dart';
import '../animations/villain_sprite_sheet.dart';
import '../controllers/villainGereneratorController.dart';
import '../main.dart';

class Villain extends SimpleEnemy with ObjectCollision, AutomaticRandomMovement, UseStateController<VillainGenerator>{
  bool canMove = true;
  double get maxLife;
  bool isDead = false;

  Villain(Vector2 position)
      : super(
    position: position, //required
    size: Vector2(64.0,64.0), //required
    life: 100,
    speed: 70,
    initDirection: Direction.down,
    animation: SimpleDirectionAnimation(
      idleLeft: VillainSpriteSheet().villianIdleLeft,
      idleRight: VillainSpriteSheet().villianIdleRight, //required
      runLeft: VillainSpriteSheet().villianRunLeft,
      runRight: VillainSpriteSheet().villianRunRight,
      runUp: VillainSpriteSheet().villianRunUp,
      idleUp: VillainSpriteSheet().villianIdleUp,
      runDown: VillainSpriteSheet().villianRunDown,
      idleDown: VillainSpriteSheet().villianIdleDown,
    )
  ){
    setupCollision(
      CollisionConfig(
        enable: true,
        collisions: [ //required
          CollisionArea.rectangle(
            size: Vector2(24,24),
            align: Vector2(19,19),
          ),
        ],
      ),
    );
    setupVision(
      //drawVision: true,
    );
  }

  @override
  bool onCollision(GameComponent component, bool active) {
    return super.onCollision(component, active);
  }

  @override
  void update(dt) {
    if(moedas >= 970 ) {
      removeFromParent();
    }
     seeAndMoveToPlayer(
        closePlayer: (player) {
          _atackMoviment();
        },
        notObserved: () {
          runRandomMovement(dt, maxDistance: 500, timeKeepStopped: 100);
        },
        visionAngle: 5,
        radiusVision: 150,
        margin: tileSize,
      );
    super.update(dt);
  }

  void _atackMoviment() {
    simpleAttackMelee(
      damage: 10,
      interval: 1000,
      size: Vector2(
          32,
          24),
      direction: lastDirection,
      //withPush: true,
      animationRight: HeroSpriteSheet().heroAttackRight,
      animationLeft: HeroSpriteSheet().heroAttackLeft,
      animationUp: HeroSpriteSheet().heroAttackUp,
      animationDown: HeroSpriteSheet().heroAttackDown,
    );
  }


  // @override
  // void renderTree(Canvas canvas) {
  //   drawDefaultLifeBar(
  //       canvas,
  //       borderWidth: 1,
  //       height: 5,
  //       align: Offset(0, -7));
  //   super.renderTree(canvas);
  // }

  @override
  void die() {
   controller.respawnMany();
    removeFromParent();
    super.die();
  }

  @override
  void receiveDamage(AttackFromEnum attacker, double damage, identify) {
    print(attacker);
    print(damage);
    print(identify);

      if(lastDirection == Direction.left) {
        animation?.playOnce(
            VillainSpriteSheet().receiveDamageLeft,
            runToTheEnd: true,
            onFinish: () {

            });
      } else if(lastDirection == Direction.right){
        animation?.playOnce(
            VillainSpriteSheet().receiveDamageRight,
            runToTheEnd: true,
            onFinish: () {

            });
      } else if(lastDirection == Direction.down){
        animation?.playOnce(
            VillainSpriteSheet().receiveDamageDown,
            runToTheEnd: true,
            onFinish: () {

            });
      } else if(lastDirection == Direction.up){
        animation?.playOnce(
            VillainSpriteSheet().receiveDamageUp,
            runToTheEnd: true,
            onFinish: () {

            });
      }

    super.receiveDamage(attacker, damage, identify);
  }

}
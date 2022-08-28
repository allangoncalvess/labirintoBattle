import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:pac/animations/master_sprite_sheet.dart';
import '../animations/atack_sprite_sheet.dart';
import '../animations/villain_sprite_sheet.dart';
import '../controllers/villainGereneratorController.dart';
import '../main.dart';

class Villain extends SimpleEnemy with ObjectCollision, AutomaticRandomMovement, UseStateController<VillainGenerator>{
  String asset = 'villain/villain.png';
  bool isDead = false;

  Villain(Vector2 position)
      : super(
    position: position, //required
    size: Vector2(48, 48), //required
    life: 100,
    speed: 70,
    initDirection: Direction.down,
    animation: SimpleDirectionAnimation(
      idleRight: VillainSpriteSheet().villianIdleRight,
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
            size: Vector2(24, 26),
            align: Vector2(12, 10),
          ),
        ],
      ),
    );
    setupVision(
      //drawVision: true,
    );
  }

  @override
  void renderTree(Canvas canvas) {
    drawDefaultLifeBar(
        canvas,
        borderWidth: 1,
        height: 5,
        align: Offset(0, -7));
    super.renderTree(canvas);
  }

  @override
  bool onCollision(GameComponent component, bool active) {
    if(component.toString() == "Instance of 'PlayerHero'" ){
      //removeFromParent();
    }
    return super.onCollision(component, active);
  }

  @override
  void update(dt) {
     seeAndMoveToPlayer(
        closePlayer: (player) {
          _executeMaleeAttack();
        },
        notObserved: () {
          runRandomMovement(dt, maxDistance: 100, timeKeepStopped: 2000);
        },
        visionAngle: 3,
        radiusVision: 100,
        margin: 12,
      );
    super.update(dt);
  }

  void _executeMaleeAttack() {
    simpleAttackMelee(
      execute: () {
        _animationMaleeAttack();
      },
      damage: 2,
      interval: 1000,
      size: Vector2(
          20,
          20),
      direction: lastDirection,
      animationRight: AtackSpriteSheet('attack/malee_right.png').attackMaleeRight,
      animationLeft: AtackSpriteSheet('attack/malee_left.png').attackMaleeLeft,
      animationUp: AtackSpriteSheet('attack/malee_up.png').attackMaleeUp,
      animationDown: AtackSpriteSheet('attack/malee_down.png').attackMaleeDown,
    );
  }

  @override
  void die() {
    removeFromParent();
    //controller.respawnMany();
    super.die();
  }

  @override
  void receiveDamage(AttackFromEnum attacker, double damage, identify) {
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

  void _animationMaleeAttack() {
    if (lastDirection == Direction.left) {
      animation?.playOnce(
          AtackSpriteSheet(asset).movimentMaleeLeft,
          runToTheEnd: true,
          onFinish: () {
            _executeMaleeAttack();
          });
    } else if (lastDirection == Direction.right) {
      animation?.playOnce(
          AtackSpriteSheet(asset).movimentMaleeRight,
          runToTheEnd: true,
          onFinish: () {
            _executeMaleeAttack();
          });
    } else if (lastDirection == Direction.down) {
      animation?.playOnce(
          AtackSpriteSheet(asset).movimentMaleeDown,
          runToTheEnd: true,
          onFinish: () {
            _executeMaleeAttack();
          });
    } else if (lastDirection == Direction.up) {
      animation?.playOnce(
          AtackSpriteSheet(asset).movimentMaleeUp,
          runToTheEnd: true,
          onFinish: () {
            _executeMaleeAttack();
          });
    }
  }

}
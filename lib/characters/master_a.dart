import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:pac/animations/master_sprite_sheet.dart';

class MasterA extends SimpleEnemy with ObjectCollision, AutomaticRandomMovement{
  bool isDead = false;

  MasterA(Vector2 position)
      : super(
    position: position, //required
    size: Vector2(48, 48), //required
    life: 4000,
    speed: 40,
    animation: SimpleDirectionAnimation(
      idleRight: MasterSpriteSheet().masterIdleRight,
      runRight: MasterSpriteSheet().masterRunRight,
    )
  ){
    setupCollision(
      CollisionConfig(
        enable: true,
        collisions: [ //required
          CollisionArea.rectangle(
            size: Vector2(25 , 40),
            align: Vector2(10, 5),
          ),
        ],
      ),
    );
    setupVision(
      //drawVision: true,
    );
  }

  @override
  void update(dt) {
    seeAndMoveToPlayer(
      closePlayer: (player) {
        _executeRangeAttack();
      },
      notObserved: () {
        runRandomMovement(dt, maxDistance: 100, timeKeepStopped: 100);
      },
      visionAngle: 7,
      radiusVision: 300,
      margin: 70,
    );
    super.update(dt);
  }

  @override
  void renderTree(Canvas canvas) {
    drawDefaultLifeBar(
        canvas,
        borderWidth: 1,
        height: 5,
        width: 64,
        align: Offset(0, -7));
    super.renderTree(canvas);
  }

  @override
  void die() {
    removeFromParent();
    //controller.respawnMany();
    super.die();
  }

  void _executeRangeAttack() {
    simpleAttackRange(
      animationRight: MasterSpriteSheet().masterRangeAttackRight,
      animationLeft: MasterSpriteSheet().masterRangeAttackLeft,
      animationUp: MasterSpriteSheet().masterRangeAttackUp,
      animationDown: MasterSpriteSheet().masterRangeAttackDown,
      animationDestroy: MasterSpriteSheet().masterRangeAttackDestroy,
      damage: 20,
      speed: 500,
      interval: 2500,
      size: Vector2(48, 48),
      destroySize: Vector2(48, 48),
      collision: CollisionConfig(
        enable: true,
        collisions: [
          //required
          CollisionArea.rectangle(
            size: Vector2(45, 45),
            align: Vector2(0, 0),
          ),
        ],
      ),
    );
  }

}
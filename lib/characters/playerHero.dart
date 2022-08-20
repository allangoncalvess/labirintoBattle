import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pac/main.dart';

import '../animations/hero_sprite_sheet.dart';

class PlayerHero extends SimplePlayer with ObjectCollision, Sensor {
  bool canMove = true;

  PlayerHero(Vector2 position)
      : super(
            position: Vector2(tileSize * 11, tileSize * 30),
            //required
            size: Vector2(64, 64),
            life: lifePlayer,
            initDirection: Direction.down,
            speed: 70,
            animation: SimpleDirectionAnimation(
              idleRight: HeroSpriteSheet().heroIdleRight,
              runRight: HeroSpriteSheet().heroRunRight,
              runUp: HeroSpriteSheet().heroRunUp,
              idleUp: HeroSpriteSheet().heroIdleUp,
              runDown: HeroSpriteSheet().heroRunDown,
              idleDown: HeroSpriteSheet().heroIdleDown,
            )) {
    setupCollision(
      CollisionConfig(
        enable: true,
        collisions: [
          //required
          CollisionArea.rectangle(
            size: Vector2(24, 24),
            align: Vector2(19, 19),
          ),
        ],
      ),
    );

    setupSensorArea(areaSensor: [
      CollisionArea.rectangle(
        size: Vector2(24, 24),
        align: Vector2(19, 19),
      ),
    ]);
  }

  @override
  bool onCollision(GameComponent component, bool active) {
    if (component.toString() == "Instance of 'Life'") {
      _executeAttack();
      life = 100;
    }
    return super.onCollision(component, active);
  }

  @override
  void onContact(GameComponent component) {
    if (component.toString() == "Instance of 'Moeda'") {
      //removeFromParent();
    }
  }

  @override
  void die() async {
    animation?.playOnce(HeroSpriteSheet().die, runToTheEnd: true, onFinish: () {
      removeFromParent();
    });

    super.die();
  }

  @override
  void update(double dt) {

    super.update(dt);
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
  void joystickAction(JoystickActionEvent event) {
    if (event.event == ActionEvent.DOWN && event.id == 1 ||
        event.id == LogicalKeyboardKey.space.keyId) {
      _executeAttack();
    }
    super.joystickAction(event);
  }

  @override
  void joystickChangeDirectional(JoystickDirectionalEvent event) {
    if (canMove) {
      super.joystickChangeDirectional(event);
    }
  }

  void _executeAttack() {
    simpleAttackMelee(
      damage: 35,
      sizePush: 16,
      size: Vector2(32, 24),
      animationRight: HeroSpriteSheet().heroAttackRight,
      animationLeft: HeroSpriteSheet().heroAttackLeft,
      animationUp: HeroSpriteSheet().heroAttackUp,
      animationDown: HeroSpriteSheet().heroAttackDown,
      withPush: true,
    );
  }

  @override
  void receiveDamage(AttackFromEnum attacker, double damage, identify) {
    canMove = false;
    if (lastDirection == Direction.left) {
      animation?.playOnce(HeroSpriteSheet().receiveDamageLeft,
          runToTheEnd: true, onFinish: () {
        canMove = true;
      });
    } else if (lastDirection == Direction.right) {
      animation?.playOnce(HeroSpriteSheet().receiveDamageRight,
          runToTheEnd: true, onFinish: () {
        canMove = true;
      });
    } else if (lastDirection == Direction.down) {
      animation?.playOnce(HeroSpriteSheet().receiveDamageDown,
          runToTheEnd: true, onFinish: () {
        canMove = true;
      });
    } else if (lastDirection == Direction.up) {
      animation?.playOnce(HeroSpriteSheet().receiveDamageUp, runToTheEnd: true,
          onFinish: () {
        canMove = true;
      });
    }
    super.receiveDamage(attacker, damage, identify);
  }
}

Future<void> _alertaDialog(BuildContext context) async {
  showDialog(
      context: context, builder: (context) => AlertDialog(
        actions: [
          // Padding(
          //   padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          //       Text(
          //         'title',
          //         style: TextStyle(
          //           fontSize: 18,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //       Text(
          //         'content',
          //         textAlign: TextAlign.center,
          //         overflow: TextOverflow.clip,
          //         style: TextStyle(
          //           fontSize: 14,
          //         ),
          //       ),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         crossAxisAlignment: CrossAxisAlignment.center,
          //         children: [
          //           TextButton(
          //             onPressed: () {
          //               if (Navigator.canPop(context)) {
          //                 Navigator.pop(context);
          //               } else {
          //                 SystemNavigator.pop();
          //               }
          //             },
          //             child: Text(''),
          //           ),
          //         ],
          //       ),
          //     ],
          //   ),
          // )
        ],
        title: Text('aaaaaaaa'),
        //contentPadding: EdgeInsets.all(20),
        content: Text('bbbbbbbbbbbbbbb'),
      ));
}

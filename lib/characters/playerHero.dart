import 'package:bonfire/bonfire.dart';
import 'package:flutter/services.dart';
import 'package:pac/animations/atack_sprite_sheet.dart';
import 'package:pac/main.dart';
import '../animations/hero_sprite_sheet.dart';
import 'package:just_audio/just_audio.dart';

class PlayerHero extends SimplePlayer with ObjectCollision, Sensor {
  bool canMove = true;
  final audioAtack = AudioPlayer();
  String asset = 'player/hero.png';

  PlayerHero(Vector2 position)
      : super(
            position: Vector2(tileSize * 52, tileSize * 40.6),
            //required
            size: Vector2(48, 48),
            life: 100,
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
            size: Vector2(24, 26),
            align: Vector2(12, 10),
          ),
        ],
      ),
    );
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
      _animationMaleeAttack();
    }

    if (event.event == ActionEvent.DOWN && event.id == 2 ||
        event.id == LogicalKeyboardKey.digit0.keyId) {
      _animationRangeAttack();
    }

    super.joystickAction(event);
  }

  @override
  void joystickChangeDirectional(JoystickDirectionalEvent event) {
    if (canMove) {
      super.joystickChangeDirectional(event);
    }
  }

  void _executeRangeAttack() {
    //_audioAtack();
    arrowPlayer = arrowPlayer - 1;
    simpleAttackRange(
      animationRight: AtackSpriteSheet('attack/range_right.png').attackRangeRight,
      animationLeft: AtackSpriteSheet('attack/range_left.png').attackRangeLeft,
      animationUp: AtackSpriteSheet('attack/range_up.png').attackRangeUp,
      animationDown: AtackSpriteSheet('attack/range_down.png').attackRangeDown,
      damage: 100,
      speed: 500,
      size: Vector2(16, 16),
      collision: CollisionConfig(
        enable: true,
        collisions: [
          //required
          CollisionArea.rectangle(
            size: Vector2(10, 10),
            align: Vector2(0, 0),
          ),
        ],
      ),
    );
  }

  void _executeMaleeAttack() {
    //_audioAtack();
    simpleAttackMelee(
      animationRight: AtackSpriteSheet('attack/malee_right.png').attackMaleeRight,
      animationLeft: AtackSpriteSheet('attack/malee_left.png').attackMaleeLeft,
      animationUp: AtackSpriteSheet('attack/malee_up.png').attackMaleeUp,
      animationDown: AtackSpriteSheet('attack/malee_down.png').attackMaleeDown,
      damage: 50,
      size: Vector2(24, 24),
      withPush: false,
      sizePush: 2,
    );
  }

  Future<void> _audioAtack () async {
    await audioAtack.setAsset('assets/audio/atack.mp3');
    await audioAtack.play();
  }

  @override
  void receiveDamage(AttackFromEnum attacker, double damage, identify) {
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

  void _animationRangeAttack() {
    if (lastDirection == Direction.left) {
      animation?.playOnce(
          AtackSpriteSheet(asset).movimentRangeLeft,
          runToTheEnd: true,
          onFinish: () {
            if(arrowPlayer > 0) {
              _executeRangeAttack();
            }
          });
    } else if (lastDirection == Direction.right) {
      animation?.playOnce(
          AtackSpriteSheet(asset).movimentRangeRight,
          runToTheEnd: true,
          onFinish: () {
            if(arrowPlayer > 0) {
              _executeRangeAttack();
            }
          });
    } else if (lastDirection == Direction.down) {
      animation?.playOnce(
          AtackSpriteSheet(asset).movimentRangeDown,
          runToTheEnd: true,
          onFinish: () {
            if(arrowPlayer > 0) {
              _executeRangeAttack();
            }
          });
    } else if (lastDirection == Direction.up) {
      animation?.playOnce(
          AtackSpriteSheet(asset).movimentRangeUp,
          runToTheEnd: true,
          onFinish: () {
            if(arrowPlayer > 0) {
              _executeRangeAttack();
            }
          });
    }
  }

  @override
  void onContact(GameComponent component) {
    if(component.toString() == "Instance of 'Life'" ){
      life = 100;
    }
  }
}



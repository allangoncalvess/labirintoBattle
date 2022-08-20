import 'package:bonfire/bonfire.dart';

class HeroSpriteSheet{
  Future<SpriteAnimation> get heroIdleLeft => SpriteAnimation.load('hero.png',
      SpriteAnimationData.sequenced(
        amount: 2,
        stepTime: 0.50,
        textureSize: Vector2(32,32),
        texturePosition: Vector2(0, 192),
      ),
  );

  Future<SpriteAnimation> get heroRunLeft => SpriteAnimation.load('hero.png',
    SpriteAnimationData.sequenced(
      amount: 2,
      stepTime: 0.10,
      textureSize: Vector2(32,32),
      texturePosition: Vector2(32, 192),
    ),
  );

  Future<SpriteAnimation> get heroIdleRight => SpriteAnimation.load('hero.png',
    SpriteAnimationData.sequenced(
      amount: 2,
      stepTime: 0.50,
      textureSize: Vector2(32,32),
      texturePosition: Vector2(0, 64),
    ),
  );

  Future<SpriteAnimation> get heroRunRight => SpriteAnimation.load('hero.png',
    SpriteAnimationData.sequenced(
      amount: 2,
      stepTime: 0.10,
      textureSize: Vector2(32,32),
      texturePosition: Vector2(32, 64),
    ),
  );

  Future<SpriteAnimation> get heroIdleUp => SpriteAnimation.load('hero.png',
    SpriteAnimationData.sequenced(
      amount: 2,
      stepTime: 0.50,
      textureSize: Vector2(32,32),
      texturePosition: Vector2(0, 128),
    ),
  );

  Future<SpriteAnimation> get heroRunUp => SpriteAnimation.load('hero.png',
    SpriteAnimationData.sequenced(
      amount: 2,
      stepTime: 0.15,
      textureSize: Vector2(32,32),
      texturePosition: Vector2(64, 128),
    ),
  );

  Future<SpriteAnimation> get heroIdleDown => SpriteAnimation.load('hero.png',
    SpriteAnimationData.sequenced(
      amount: 2,
      stepTime: 0.50,
      textureSize: Vector2(32,32),
      texturePosition: Vector2(0, 0),
    ),
  );

  Future<SpriteAnimation> get heroRunDown => SpriteAnimation.load('hero.png',
    SpriteAnimationData.sequenced(
      amount: 2,
      stepTime: 0.15,
      textureSize: Vector2(32,32),
      texturePosition: Vector2(64, 0),
    ),
  );

  Future<SpriteAnimation> get heroAttackRight => SpriteAnimation.load('atack_right.png',
    SpriteAnimationData.sequenced(
      amount: 3,
      stepTime: 0.30,
      textureSize: Vector2(32, 32),
      texturePosition: Vector2(0, 0),
    ),
  );

  Future<SpriteAnimation> get heroAttackLeft => SpriteAnimation.load('atack_left.png',
    SpriteAnimationData.sequenced(
      amount: 3,
      stepTime: 0.30,
      textureSize: Vector2(32, 32),
      texturePosition: Vector2(0, 0),
    ),
  );

  Future<SpriteAnimation> get heroAttackUp => SpriteAnimation.load('atack_top.png',
    SpriteAnimationData.sequenced(
      amount: 3,
      stepTime: 0.30,
      textureSize: Vector2(32, 32),
      texturePosition: Vector2(0, 0),
    ),
  );

  Future<SpriteAnimation> get heroAttackDown => SpriteAnimation.load('atack_bottom.png',
    SpriteAnimationData.sequenced(
      amount: 3,
      stepTime: 0.30,
      textureSize: Vector2(32, 32),
      texturePosition: Vector2(0, 0),
    ),
  );


  Future<SpriteAnimation> get receiveDamageRight => SpriteAnimation.load('hero.png',
    SpriteAnimationData.sequenced(
      amount: 2,
      stepTime: 0.15,
      textureSize: Vector2(32, 32),
      texturePosition: Vector2(640, 0),
    ),
  );

  Future<SpriteAnimation> get receiveDamageLeft => SpriteAnimation.load('hero.png',
    SpriteAnimationData.sequenced(
      amount: 2,
      stepTime: 0.15,
      textureSize: Vector2(32, 32),
      texturePosition: Vector2(640, 0),
    ),
  );

  Future<SpriteAnimation> get receiveDamageDown => SpriteAnimation.load('hero.png',
    SpriteAnimationData.sequenced(
      amount: 2,
      stepTime: 0.15,
      textureSize: Vector2(32, 32),
      texturePosition: Vector2(640, 0),
    ),
  );

  Future<SpriteAnimation> get receiveDamageUp => SpriteAnimation.load('hero.png',
    SpriteAnimationData.sequenced(
      amount: 2,
      stepTime: 0.15,
      textureSize: Vector2(32, 32),
      texturePosition: Vector2(640, 0),
    ),
  );

  Future<SpriteAnimation> get dieRight => SpriteAnimation.load('hero.png',
    SpriteAnimationData.sequenced(
      amount: 3,
      stepTime: 0.10,
      textureSize: Vector2(32, 32),
      texturePosition: Vector2(672, 64),
    ),
  );

  Future<SpriteAnimation> get die => SpriteAnimation.load('hero.png',
    SpriteAnimationData.sequenced(
      amount: 5,
      stepTime: 0.50,
      textureSize: Vector2(32, 32),
      texturePosition: Vector2(608, 64),
    ),
  );


}
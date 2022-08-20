import 'package:bonfire/bonfire.dart';

class VillainSpriteSheet{
  Future<SpriteAnimation> get villianIdleLeft => SpriteAnimation.load('villain.png',
    SpriteAnimationData.sequenced(
      amount: 2,
      stepTime: 0.50,
      textureSize: Vector2(32, 32),
      texturePosition: Vector2(0, 192),

    ),
  );

  Future<SpriteAnimation> get villianRunLeft => SpriteAnimation.load('villain.png',
    SpriteAnimationData.sequenced(
      amount: 2,
      stepTime: 0.10,
      textureSize: Vector2(32, 32),
      texturePosition: Vector2(32, 192),
    ),
  );

  Future<SpriteAnimation> get villianIdleRight => SpriteAnimation.load('villain.png',
    SpriteAnimationData.sequenced(
      amount: 2,
      stepTime: 0.50,
      textureSize: Vector2(32, 32),
      texturePosition: Vector2(0, 64),
    ),
  );

  Future<SpriteAnimation> get villianRunRight => SpriteAnimation.load('villain.png',
    SpriteAnimationData.sequenced(
      amount: 2,
      stepTime: 0.10,
      textureSize: Vector2(32, 32),
      texturePosition: Vector2(32, 64),
    ),
  );

  Future<SpriteAnimation> get villianIdleUp => SpriteAnimation.load('villain.png',
    SpriteAnimationData.sequenced(
      amount: 2,
      stepTime: 0.50,
      textureSize: Vector2(32, 32),
      texturePosition: Vector2(0, 128),
    ),
  );

  Future<SpriteAnimation> get villianRunUp => SpriteAnimation.load('villain.png',
    SpriteAnimationData.sequenced(
      amount: 2,
      stepTime: 0.15,
      textureSize: Vector2(32, 32),
      texturePosition: Vector2(64, 128),
    ),
  );

  Future<SpriteAnimation> get villianIdleDown => SpriteAnimation.load('villain.png',
    SpriteAnimationData.sequenced(
      amount: 2,
      stepTime: 0.50,
      textureSize: Vector2(32, 32),
      texturePosition: Vector2(0, 0),
    ),
  );

  Future<SpriteAnimation> get villianRunDown => SpriteAnimation.load('villain.png',
    SpriteAnimationData.sequenced(
      amount: 2,
      stepTime: 0.15,
      textureSize: Vector2(32, 32),
      texturePosition: Vector2(64, 0),
    ),
  );

  Future<SpriteAnimation> get receiveDamageRight => SpriteAnimation.load('villain.png',
    SpriteAnimationData.sequenced(
      amount: 2,
      stepTime: 0.60,
      textureSize: Vector2(32, 32),
      texturePosition: Vector2(640, 0),
    ),
  );

  Future<SpriteAnimation> get receiveDamageLeft => SpriteAnimation.load('villain.png',
    SpriteAnimationData.sequenced(
      amount: 2,
      stepTime: 0.30,
      textureSize: Vector2(32, 32),
      texturePosition: Vector2(640, 0),
    ),
  );

  Future<SpriteAnimation> get receiveDamageDown => SpriteAnimation.load('villain.png',
    SpriteAnimationData.sequenced(
      amount: 2,
      stepTime: 0.60,
      textureSize: Vector2(32, 32),
      texturePosition: Vector2(640, 0),
    ),
  );

  Future<SpriteAnimation> get receiveDamageUp => SpriteAnimation.load('villain.png',
    SpriteAnimationData.sequenced(
      amount: 2,
      stepTime: 0.30,
      textureSize: Vector2(32, 32),
      texturePosition: Vector2(640, 0),
    ),
  );

  Future<SpriteAnimation> get die => SpriteAnimation.load('villain.png',
    SpriteAnimationData.sequenced(
      amount: 5,
      stepTime: 0.09,
      textureSize: Vector2(32, 32),
      texturePosition: Vector2(608, 64),
    ),
  );
}
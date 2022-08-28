import 'package:bonfire/bonfire.dart';

class VillainSpriteSheet{

  String asset_url = 'villain/villain.png';

  Future<SpriteAnimation> get villianIdleLeft => SpriteAnimation.load(asset_url,
    SpriteAnimationData.sequenced(
      amount: 2,
      stepTime: 0.50,
      textureSize: Vector2(32, 32),
      texturePosition: Vector2(0, 192),

    ),
  );

  Future<SpriteAnimation> get villianRunLeft => SpriteAnimation.load(asset_url,
    SpriteAnimationData.sequenced(
      amount: 2,
      stepTime: 0.10,
      textureSize: Vector2(32, 32),
      texturePosition: Vector2(32, 192),
    ),
  );

  Future<SpriteAnimation> get villianIdleRight => SpriteAnimation.load(asset_url,
    SpriteAnimationData.sequenced(
      amount: 2,
      stepTime: 0.50,
      textureSize: Vector2(32, 32),
      texturePosition: Vector2(0, 64),
    ),
  );

  Future<SpriteAnimation> get villianRunRight => SpriteAnimation.load(asset_url,
    SpriteAnimationData.sequenced(
      amount: 2,
      stepTime: 0.10,
      textureSize: Vector2(32, 32),
      texturePosition: Vector2(32, 64),
    ),
  );

  Future<SpriteAnimation> get villianIdleUp => SpriteAnimation.load(asset_url,
    SpriteAnimationData.sequenced(
      amount: 2,
      stepTime: 0.50,
      textureSize: Vector2(32, 32),
      texturePosition: Vector2(0, 128),
    ),
  );

  Future<SpriteAnimation> get villianRunUp => SpriteAnimation.load(asset_url,
    SpriteAnimationData.sequenced(
      amount: 2,
      stepTime: 0.15,
      textureSize: Vector2(32, 32),
      texturePosition: Vector2(64, 128),
    ),
  );

  Future<SpriteAnimation> get villianIdleDown => SpriteAnimation.load(asset_url,
    SpriteAnimationData.sequenced(
      amount: 2,
      stepTime: 0.50,
      textureSize: Vector2(32, 32),
      texturePosition: Vector2(0, 0),
    ),
  );

  Future<SpriteAnimation> get villianRunDown => SpriteAnimation.load(asset_url,
    SpriteAnimationData.sequenced(
      amount: 2,
      stepTime: 0.15,
      textureSize: Vector2(32, 32),
      texturePosition: Vector2(64, 0),
    ),
  );

  Future<SpriteAnimation> get receiveDamageRight => SpriteAnimation.load(asset_url,
    SpriteAnimationData.sequenced(
      amount: 2,
      stepTime: 0.15,
      textureSize: Vector2(32, 32),
      texturePosition: Vector2(640, 0),
    ),
  );

  Future<SpriteAnimation> get receiveDamageLeft => SpriteAnimation.load(asset_url,
    SpriteAnimationData.sequenced(
      amount: 2,
      stepTime: 0.15,
      textureSize: Vector2(32, 32),
      texturePosition: Vector2(640, 0),
    ),
  );

  Future<SpriteAnimation> get receiveDamageDown => SpriteAnimation.load(asset_url,
    SpriteAnimationData.sequenced(
      amount: 2,
      stepTime: 0.15,
      textureSize: Vector2(32, 32),
      texturePosition: Vector2(640, 0),
    ),
  );

  Future<SpriteAnimation> get receiveDamageUp => SpriteAnimation.load(asset_url,
    SpriteAnimationData.sequenced(
      amount: 2,
      stepTime: 0.15,
      textureSize: Vector2(32, 32),
      texturePosition: Vector2(640, 0),
    ),
  );

  Future<SpriteAnimation> get die => SpriteAnimation.load(asset_url,
    SpriteAnimationData.sequenced(
      amount: 5,
      stepTime: 0.15,
      textureSize: Vector2(32, 32),
      texturePosition: Vector2(608, 64),
    ),
  );
}
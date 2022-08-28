import 'package:bonfire/bonfire.dart';

// double xIdLeft;
// double xLeft;

class HeroSpriteSheet{

  String asset_url = 'player/hero.png';

  Future<SpriteAnimation> get heroIdleLeft => SpriteAnimation.load(asset_url,
      SpriteAnimationData.sequenced(
        amount: 2,
        stepTime: 0.50,
        textureSize: Vector2(32,32),
        texturePosition: Vector2(0, 192),
      ),
  );

  Future<SpriteAnimation> get heroRunLeft => SpriteAnimation.load(asset_url,
    SpriteAnimationData.sequenced(
      amount: 2,
      stepTime: 0.10,
      textureSize: Vector2(32,32),
      texturePosition: Vector2(32, 192),
    ),
  );

  Future<SpriteAnimation> get heroIdleRight => SpriteAnimation.load(asset_url,
    SpriteAnimationData.sequenced(
      amount: 2,
      stepTime: 0.50,
      textureSize: Vector2(32,32),
      texturePosition: Vector2(0, 64),
    ),
  );

  Future<SpriteAnimation> get heroRunRight => SpriteAnimation.load(asset_url,
    SpriteAnimationData.sequenced(
      amount: 2,
      stepTime: 0.10,
      textureSize: Vector2(32,32),
      texturePosition: Vector2(32, 64),
    ),
  );

  Future<SpriteAnimation> get heroIdleUp => SpriteAnimation.load(asset_url,
    SpriteAnimationData.sequenced(
      amount: 2,
      stepTime: 0.50,
      textureSize: Vector2(32,32),
      texturePosition: Vector2(0, 128),
    ),
  );

  Future<SpriteAnimation> get heroRunUp => SpriteAnimation.load(asset_url,
    SpriteAnimationData.sequenced(
      amount: 2,
      stepTime: 0.15,
      textureSize: Vector2(32,32),
      texturePosition: Vector2(64, 128),
    ),
  );

  Future<SpriteAnimation> get heroIdleDown => SpriteAnimation.load(asset_url,
    SpriteAnimationData.sequenced(
      amount: 2,
      stepTime: 0.50,
      textureSize: Vector2(32,32),
      texturePosition: Vector2(0, 0),
    ),
  );

  Future<SpriteAnimation> get heroRunDown => SpriteAnimation.load(asset_url,
    SpriteAnimationData.sequenced(
      amount: 2,
      stepTime: 0.15,
      textureSize: Vector2(32,32),
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

  Future<SpriteAnimation> get dieRight => SpriteAnimation.load(asset_url,
    SpriteAnimationData.sequenced(
      amount: 3,
      stepTime: 0.04,
      textureSize: Vector2(32, 32),
      texturePosition: Vector2(672, 64),
    ),
  );

  Future<SpriteAnimation> get die => SpriteAnimation.load(asset_url,
    SpriteAnimationData.sequenced(
      amount: 5,
      stepTime: 0.50,
      textureSize: Vector2(32, 32),
      texturePosition: Vector2(608, 64),
    ),
  );


}
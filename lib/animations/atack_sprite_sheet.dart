import 'package:bonfire/bonfire.dart';

class AtackSpriteSheet{
  String asset_url;

  AtackSpriteSheet(this.asset_url);

  //simpleAtack
  Future<SpriteAnimation> get attackMaleeRight => SpriteAnimation.load(asset_url,
      SpriteAnimationData.sequenced(
        amount: 3,
        stepTime: 0.20,
        textureSize: Vector2(20, 20),
        texturePosition: Vector2(0, 0),
      ),
    );

    Future<SpriteAnimation> get attackMaleeLeft => SpriteAnimation.load(asset_url,
      SpriteAnimationData.sequenced(
        amount: 3,
        stepTime: 0.20,
        textureSize: Vector2(20, 20),
        texturePosition: Vector2(0, 0),
      ),
    );

    Future<SpriteAnimation> get attackMaleeUp => SpriteAnimation.load(asset_url,
      SpriteAnimationData.sequenced(
        amount: 3,
        stepTime: 0.20,
        textureSize: Vector2(20, 20),
        texturePosition: Vector2(0, 0),
      ),
    );

    Future<SpriteAnimation> get attackMaleeDown => SpriteAnimation.load(asset_url,
      SpriteAnimationData.sequenced(
        amount: 3,
        stepTime: 0.20,
        textureSize: Vector2(20, 20),
        texturePosition: Vector2(0, 0),
      ),
    );


//simpleAtackRange
    Future<SpriteAnimation> get attackRangeRight => SpriteAnimation.load(asset_url,
      SpriteAnimationData.sequenced(
        amount: 1,
        stepTime: 5,
        textureSize: Vector2(24, 24),
        texturePosition: Vector2(0, 0),
      ),
    );

    Future<SpriteAnimation> get attackRangeLeft => SpriteAnimation.load(asset_url,
      SpriteAnimationData.sequenced(
        amount: 1,
        stepTime: 5,
        textureSize: Vector2(24, 24),
        texturePosition: Vector2(0, 0),
      ),
    );

    Future<SpriteAnimation> get attackRangeUp => SpriteAnimation.load(asset_url,
      SpriteAnimationData.sequenced(
        amount: 1,
        stepTime: 5,
        textureSize: Vector2(24, 24),
        texturePosition: Vector2(0, 0),
      ),
    );

    Future<SpriteAnimation> get attackRangeDown => SpriteAnimation.load(asset_url,
      SpriteAnimationData.sequenced(
        amount: 1,
        stepTime: 5,
        textureSize: Vector2(24, 24),
        texturePosition: Vector2(0, 0),
      ),
    );


    //moviments malee attack
    Future<SpriteAnimation> get movimentMaleeRight => SpriteAnimation.load(asset_url,
      SpriteAnimationData.sequenced(
        amount: 4,
        stepTime: 0.05,
        textureSize: Vector2(32, 32),
        texturePosition: Vector2(128, 64),
      ),
    );

    Future<SpriteAnimation> get movimentMaleeLeft => SpriteAnimation.load(asset_url,
      SpriteAnimationData.sequenced(
        amount: 4,
        stepTime: 0.05,
        textureSize: Vector2(32, 32),
        texturePosition: Vector2(128, 192),
      ),
    );

    Future<SpriteAnimation> get movimentMaleeUp => SpriteAnimation.load(asset_url,
      SpriteAnimationData.sequenced(
        amount: 4,
        stepTime: 0.05,
        textureSize: Vector2(32, 32),
        texturePosition: Vector2(128, 128),
      ),
    );

    Future<SpriteAnimation> get movimentMaleeDown => SpriteAnimation.load(asset_url,
      SpriteAnimationData.sequenced(
        amount: 4,
        stepTime: 0.05,
        textureSize: Vector2(32, 32),
        texturePosition: Vector2(128, 0),
      ),
    );

  //moviments range attack
  Future<SpriteAnimation> get movimentRangeRight => SpriteAnimation.load(asset_url,
    SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.10,
      textureSize: Vector2(32, 32),
      texturePosition: Vector2(224, 64),
    ),
  );

  Future<SpriteAnimation> get movimentRangeLeft => SpriteAnimation.load(asset_url,
    SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.10,
      textureSize: Vector2(32, 32),
      texturePosition: Vector2(224, 192),
    ),
  );

  Future<SpriteAnimation> get movimentRangeUp => SpriteAnimation.load(asset_url,
    SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.10,
      textureSize: Vector2(32, 32),
      texturePosition: Vector2(224, 128),
    ),
  );

  Future<SpriteAnimation> get movimentRangeDown => SpriteAnimation.load(asset_url,
    SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.10,
      textureSize: Vector2(32, 32),
      texturePosition: Vector2(224, 0),
    ),
  );

}
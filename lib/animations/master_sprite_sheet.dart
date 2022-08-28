import 'package:bonfire/bonfire.dart';

class MasterSpriteSheet{

  String asset_moviment = 'villain/master_a.png';
  String asset_attack_right = 'attack/fireball_right_ma.png';
  String asset_attack_left = 'attack/fireball_left_ma.png';
  String asset_attack_up = 'attack/fireball_up_ma.png';
  String asset_attack_down = 'attack/fireball_down_ma.png';
  String asset_destroy = 'attack/explosion_fire_ma.png';

  //moviment
  Future<SpriteAnimation> get masterIdleRight => SpriteAnimation.load(asset_moviment,
    SpriteAnimationData.sequenced(
      amount: 2,
      stepTime: 0.50,
      textureSize: Vector2(30, 35),
      texturePosition: Vector2(0, 0),
    ),
  );

  Future<SpriteAnimation> get masterRunRight => SpriteAnimation.load(asset_moviment,
    SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.15,
      textureSize: Vector2(30, 35),
      texturePosition: Vector2(128, 0),
    ),
  );

  Future<SpriteAnimation> get die => SpriteAnimation.load(asset_moviment,
    SpriteAnimationData.sequenced(
      amount: 5,
      stepTime: 0.15,
      textureSize: Vector2(32, 32),
      texturePosition: Vector2(608, 64),
    ),
  );

  //Attack
  Future<SpriteAnimation> get masterRangeAttackRight => SpriteAnimation.load(asset_attack_right,
    SpriteAnimationData.sequenced(
      amount: 1,
      stepTime: 0.10,
      textureSize: Vector2(32, 32),
      texturePosition: Vector2(0, 0),
    ),
  );

  Future<SpriteAnimation> get masterRangeAttackLeft => SpriteAnimation.load(asset_attack_left,
    SpriteAnimationData.sequenced(
      amount: 1,
      stepTime: 0.10,
      textureSize: Vector2(32, 32),
      texturePosition: Vector2(0, 0),
    ),
  );

  Future<SpriteAnimation> get masterRangeAttackUp => SpriteAnimation.load(asset_attack_up,
    SpriteAnimationData.sequenced(
      amount: 1,
      stepTime: 0.10,
      textureSize: Vector2(32, 32),
      texturePosition: Vector2(0, 0),
    ),
  );

  Future<SpriteAnimation> get masterRangeAttackDown => SpriteAnimation.load(asset_attack_down,
    SpriteAnimationData.sequenced(
      amount: 1,
      stepTime: 0.10,
      textureSize: Vector2(32, 32),
      texturePosition: Vector2(0, 0),
    ),
  );

  Future<SpriteAnimation> get masterRangeAttackDestroy => SpriteAnimation.load(asset_destroy,
    SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.10,
      textureSize: Vector2(32, 32),
      texturePosition: Vector2(0, 0),
    ),
  );
}
import 'package:bonfire/bonfire.dart';
import 'package:pac/main.dart';

class LifeSpriteSheet{
  String asset_url = 'map/diversos.png';

  Future<SpriteAnimation> get image => SpriteAnimation.load(asset_url,
    SpriteAnimationData.sequenced(
      amount: 1,
      stepTime: 0.50,
      textureSize: Vector2(16, 16),
      texturePosition: Vector2(20*tileSize, 14*tileSize),
    ),
  );
}
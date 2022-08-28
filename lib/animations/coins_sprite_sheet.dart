import 'package:bonfire/bonfire.dart';
import 'package:pac/main.dart';

class CoinsSpriteSheet{

  Future<SpriteAnimation> get image => SpriteAnimation.load('map/diversos.png',
    SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.15,
      textureSize: Vector2(8, 8),
      texturePosition: Vector2(tileSize * 18, tileSize * 17),
    ),
  );
}




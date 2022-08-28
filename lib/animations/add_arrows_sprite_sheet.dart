import 'package:bonfire/bonfire.dart';

class AddArrowsSpriteSheet{
  String asset_url = 'items/add_arrows.png';

  Future<SpriteAnimation> get image => SpriteAnimation.load(asset_url,
    SpriteAnimationData.sequenced(
      amount: 1,
      stepTime: 0.30,
      textureSize: Vector2(24, 24),
      texturePosition: Vector2(0, 0),
    ),
  );
}
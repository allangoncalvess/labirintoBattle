import 'dart:math';
import 'package:bonfire/bonfire.dart';
import 'package:pac/characters/villain.dart';
import '../../main.dart';

class VillainGenerator extends StateController<Villain> {
    final _positionsToRespawn = [
      Vector2(1 * tileSize, 14 * tileSize),
      //Vector2(1 * tileSize, 17 * tileSize),
      Vector2(1 * tileSize, 20 * tileSize),
      //Vector2(1 * tileSize, 23 * tileSize),
      Vector2(1 * tileSize, 26 * tileSize),
      //Vector2(1 * tileSize, 29 * tileSize),
      Vector2(1 * tileSize, 32 * tileSize),
      //Vector2(1 * tileSize, 35 * tileSize),
      Vector2(1 * tileSize, 11 * tileSize),
      //Vector2(3.5 * tileSize, 11 * tileSize),
      Vector2(6 * tileSize, 11 * tileSize),
      //Vector2(9 * tileSize, 11 * tileSize),
      Vector2(12 * tileSize, 11 * tileSize),
      //Vector2(15 * tileSize, 11 * tileSize),
      Vector2(18 * tileSize, 11 * tileSize),
      //Vector2(21* tileSize, 35 * tileSize),
      Vector2(24* tileSize, 35 * tileSize),
      //Vector2(3.5 * tileSize, 35 * tileSize),
      Vector2(6 * tileSize, 35 * tileSize),
      //Vector2(9 * tileSize, 35 * tileSize),
      Vector2(12 * tileSize, 35 * tileSize),
      //Vector2(15 * tileSize, 35 * tileSize),
      Vector2(18 * tileSize, 35 * tileSize),
      //Vector2(21* tileSize, 35 * tileSize),
      Vector2(25 * tileSize, 11 * tileSize),
      //Vector2(25 * tileSize, 14 * tileSize),
      Vector2(25 * tileSize, 17 * tileSize),
      //Vector2(25 * tileSize, 20 * tileSize),
      Vector2(25 * tileSize, 23 * tileSize),
      //Vector2(25 * tileSize, 26 * tileSize),
      Vector2(25 * tileSize, 29 * tileSize),
      //Vector2(25 * tileSize, 32 * tileSize),
      Vector2(25 * tileSize, 35 * tileSize),
      Vector2(9 * tileSize, 14 * tileSize),
      //Vector2(9 * tileSize, 17 * tileSize),
      Vector2(9 * tileSize, 20 * tileSize),
      //Vector2(9 * tileSize, 23 * tileSize),
      Vector2(6 * tileSize, 23 * tileSize),
      //Vector2(3.5 * tileSize, 23 * tileSize),
      Vector2(20 * tileSize, 13 * tileSize),
      //Vector2(20 * tileSize, 16 * tileSize),
      Vector2(20 * tileSize, 19 * tileSize),
      //Vector2(20 * tileSize, 22 * tileSize),
      Vector2(20 * tileSize, 25 * tileSize),

    ];
    final _quantityRespawns = 1;

    @override
    void update(double dt, component) {
    }

  void _respawn(Vector2 position) {
      final hasGameref = component?.hasGameRef ?? false;
      if (hasGameref && !gameRef.camera.isMoving) {
        final villain = Villain(position);
        gameRef.add(villain);
      }
  }

  void respawnMany() {
      final random = Random();
      final posisitions = List<Vector2>.from(_positionsToRespawn);
      int numberOfRespawn = _quantityRespawns;

      while (numberOfRespawn > 0) {
        final indexPosition = random.nextInt(posisitions.length);
        final position = posisitions[indexPosition];
        _respawn(position);
        posisitions.remove(position);
        numberOfRespawn -= 1;
      }

  }

}
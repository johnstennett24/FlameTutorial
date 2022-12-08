import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flame_snake/EmberPlayer.dart';
import 'package:flame_snake/objects/GroundBlock.dart';
import 'package:flame_snake/objects/Platform.dart';
import 'package:flame_snake/objects/actors/WaterEnemy.dart';
import 'package:flame_snake/objects/managers/SegmentManager.dart';
import 'objects/Star.dart';

class EmberQuest extends FlameGame
    with HasKeyboardHandlerComponents, HasCollisionDetection {
  EmberQuest();
  late EmberPlayer _ember;
  double objectSpeed = 0.0;
  late double lasBlockXPosition = 0.0;
  late UniqueKey lastBlockKey;

  @override
  Color backgroundColor() {
    return const Color.fromARGB(255, 173, 223, 247);
  }

  @override
  Future<void> onLoad() async {
    await images.loadAll([
      'block.png',
      'ember.png',
      'ground.png',
      'heart_half.png',
      'heart.png',
      'star.png',
      'water_enemy.png'
    ]);
    initializeGame();
  }

  void loadGameSegments(int segmentIndex, double xPositionOffset) {
    for (final block in segments[segmentIndex]) {
      switch (block.blockType) {
        case GroundBlock:
          add(GroundBlock(
              gridPosition: block.gridPosition, xOffset: xPositionOffset));
          break;
        case PlatformBlock:
          add(PlatformBlock(
              gridPosition: block.gridPosition, xOffset: xPositionOffset));
          break;
        case Star:
          add(Star(gridPosition: block.gridPosition, xOffset: xPositionOffset));
          break;
        case WaterEnemy:
          add(WaterEnemy(
              gridPosition: block.gridPosition, xOffset: xPositionOffset));
          break;
      }
    }
  }

  void initializeGame() {
    final segmentToLoad = (size.x / 640).ceil();
    segmentToLoad.clamp(0, segments.length);

    for (var i = 0; i <= segmentToLoad; i++) {
      loadGameSegments(i, (640 * i).toDouble());
    }
    _ember = EmberPlayer(
      position: Vector2(128, canvasSize.y - 128),
    );
    add(_ember);
  }
}

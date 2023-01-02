import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  final game = MyGame();
  runApp(GameWidget(game: game));
}

class MyGame extends FlameGame with HasCollisionDetection {
  @override
  Future<void> onLoad() async {
    add(CenterComponent());

    final sprite =
        await Sprite.load('strawberry dress_smiling open eyes and blush.png');
    final player = SpriteComponent(
      sprite: sprite,
      size: Vector2(100, 400),
    );
    add(player);
  }

  @override
  Color backgroundColor() => const Color(0x00000000);
}

class CenterComponent extends PositionComponent {
  CenterComponent()
      : super(
          position: Vector2(100, 100),
          size: Vector2(50, 50),
          anchor: Anchor.center,
        );

  @override
  Future<void> onLoad() async {
    await add(
      PositionComponent(position: Vector2(0, -50)),
    );
  }
}

class MyComponent extends PositionComponent {
  Future<void> onLoad() async {
    add(RectangleHitbox());
  }
}

class MyCollidable extends PositionComponent with CollisionCallbacks {
  @override
  void onCollision(Set<Vector2> points, PositionComponent other) {
    if (other is MyComponent) {
      // ...
    }
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    if (other is MyComponent) {
      // ...
    }
  }
}

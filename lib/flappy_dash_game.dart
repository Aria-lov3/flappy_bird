import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flappy_bird/componet/dash_parallax_background.dart';
import 'package:flappy_bird/componet/dash.dart';
import 'package:flappy_bird/componet/pipe_pair.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class FlappyDashGame extends FlameGame<FlappyDashWorld> with KeyboardEvents {
  FlappyDashGame()
    : super(
        world: FlappyDashWorld(),
        camera: CameraComponent.withFixedResolution(width: 600, height: 1000),
      );
  @override
  KeyEventResult onKeyEvent(
    KeyEvent event,
    Set<LogicalKeyboardKey> keysPressed,
  ) {
    final isKeyDown = event is KeyDownEvent;

    final isSpace = keysPressed.contains(LogicalKeyboardKey.space);

    if (isSpace && isKeyDown) {
      world.onSpaceDown();
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }
}

class FlappyDashWorld extends World
    with TapCallbacks, HasGameReference<FlappyDashGame> {
  late Dash _dash;
  late PipePair _lastPipe;
  static const _pipesDistance = 400.0;

  @override
  void onLoad() async {
    super.onLoad();
    add(DashParallaxBackground());
    add(_dash = Dash());

    _generatePipes(fromX: 350);
  }

  void _generatePipes({int count = 5, double fromX = 0.0}) {
    for (int i = 0; i < count; i++) {
      final area = 600;
      final y = (Random().nextDouble() * area) - (area / 2);
      add(
        _lastPipe = PipePair(
          position: Vector2(fromX + (i * _pipesDistance), y),
        ),
      );
    }
  }

  void _tryToRemoveOldpipes() {
    final pipes = children.whereType<PipePair>();
    final shuldeBeRemove = max(pipes.length - 5, 0);
    pipes.take(shuldeBeRemove).forEach((pipe) {
      pipe.removeFromParent();
    });
  }

  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);
    _dash.jump();
  }

  void onSpaceDown() {
    _dash.jump();
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (_dash.x >= _lastPipe.x) {
      _generatePipes(fromX: _pipesDistance);
      _tryToRemoveOldpipes();
    }
    //game.camera.viewfinder.zoom = 0.05;
  }
}

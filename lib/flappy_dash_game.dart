import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flappy_bird/componet/dash_parallax_background.dart';
import 'package:flappy_bird/componet/dash.dart';
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

class FlappyDashWorld extends World with TapCallbacks {
  late Dash _dash;

  @override
  void onLoad() async {
    super.onLoad();
    add(DashParallaxBackground());
    add(_dash = Dash());
  }

  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);
    _dash.jump();
  }

  void onSpaceDown() {
    _dash.jump();
  }
}

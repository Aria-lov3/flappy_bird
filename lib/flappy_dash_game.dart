import 'package:flame/camera.dart';
import 'package:flame/game.dart';

class FlappyDashGame extends FlameGame<FlappyDashWorld> {
  FlappyDashGame()
    : super(
        world: FlappyDashWorld(),
        camera: CameraComponent.withFixedResolution(width: 600, height: 1000),
      );
}

class FlappyDashWorld extends World {}

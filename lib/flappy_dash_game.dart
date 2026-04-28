import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flappy_bird/componet/dash_parallax_background.dart';
import 'package:flappy_bird/componet/dash.dart';

class FlappyDashGame extends FlameGame<FlappyDashWorld> {
  FlappyDashGame()
    : super(
        world: FlappyDashWorld(),
        camera: CameraComponent.withFixedResolution(width: 600, height: 1000),
      );
}

class FlappyDashWorld extends World {
  @override
  Future<void> onLoad() async {
    super.onLoad();
    add(DashParallaxBackground());
    add(Dash());
  }
}

import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flappy_bird/flappy_dash_game.dart';

class DashParallaxBackground extends ParallaxComponent<FlappyDashGame> {
  @override
  Future<void> onLoad() async {
    anchor = Anchor.center;
    parallax = await game.loadParallax(
      [
        ParallaxImageData('background/_11_background.png'),
        ParallaxImageData('background/_10_distant_clouds.png'),
        ParallaxImageData('background/_09_distant_clouds1.png'),
        ParallaxImageData('background/_08_clouds.png'),
        ParallaxImageData('background/_07_huge_clouds.png'),
        ParallaxImageData('background/_06_hill2.png'),
        ParallaxImageData('background/_05_hill1.png'),
        ParallaxImageData('background/_04_bushes.png'),
        ParallaxImageData('background/_03_distant_trees.png'),
        ParallaxImageData('background/trees.png'),
        ParallaxImageData('background/_01_ground.png'),
      ],
      baseVelocity: Vector2(1, 0),
      velocityMultiplierDelta: Vector2(1.7, 0),
    );
  }
}

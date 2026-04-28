import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flappy_bird/flappy_dash_game.dart';

class DashParallaxBackground extends ParallaxComponent<FlappyDashGame> {
  @override
  Future<void> onLoad() async {
    anchor = Anchor.center;
    parallax = await game.loadParallax(
      [
        ParallaxImageData('background/_01_ground.png'),
        ParallaxImageData('background/trees.png'),
        ParallaxImageData('background/_03_distant_trees.png'),
        ParallaxImageData('background/_04_bushes.png'),
        ParallaxImageData('background/_05_hill1.png'),
        ParallaxImageData('background/_06_hill2.png'),
        ParallaxImageData('background/_07_hill3.png'),
        ParallaxImageData('background/_08_cloud1.png'),
        ParallaxImageData('background/_09_cloud2.png'),
        ParallaxImageData('background/_10_cloud3.png'),
        ParallaxImageData('background/_11_background.png'),
      ],
      baseVelocity: Vector2(1, 0),
      velocityMultiplierDelta: Vector2(1.7, 0),
    );
  }
}

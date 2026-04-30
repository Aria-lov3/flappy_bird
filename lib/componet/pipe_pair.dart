import 'package:flame/components.dart';
import 'package:flappy_bird/componet/pipe.dart';

class PipePair extends PositionComponent {
  PipePair({required super.position, this.gap = 35.0, this.speed = 200.0});

  final double gap;
  final double speed;

  @override
  void onLoad() {
    super.onLoad();
    addAll([
      Pipe(isFlipped: false, position: Vector2(0, gap / 2)),
      Pipe(isFlipped: true, position: Vector2(0, -(gap / 2))),
    ]);
  }

  @override
  void update(double dt) {
    position.x -= speed * dt;
    super.update(dt);
  }
}

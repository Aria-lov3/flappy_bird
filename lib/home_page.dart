import 'package:flame/game.dart';
import 'package:flappy_bird/flappy_dash_game.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late FlappyDashGame _flappyDashGame;

  @override
  void initState() {
    super.initState();
    _flappyDashGame = FlappyDashGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GameWidget(game: _flappyDashGame));
  }
}

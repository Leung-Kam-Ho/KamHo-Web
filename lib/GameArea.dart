import 'package:firebasetest/Game.dart';
import 'package:flutter/material.dart';

class GameArea extends StatefulWidget {
  const GameArea({Key? key}) : super(key: key);

  @override
  _GameAreaState createState() => _GameAreaState();
}

class _GameAreaState extends State<GameArea> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: AspectRatio(aspectRatio: 1 / 3, child: Game()),
      )),
    );
    ;
  }
}

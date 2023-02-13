import 'package:firebasetest/Game.dart';
import 'package:flutter/material.dart';

class GameArea extends StatefulWidget {
  const GameArea({ Key? key }) : super(key: key);

  @override
  _GameAreaState createState() => _GameAreaState();
}

class _GameAreaState extends State<GameArea> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(25)),
      child: Container(
        color: Colors.black,
        child: Center(child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Game(),
        )),
        
      ),
    );
  }
}
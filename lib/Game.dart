import 'dart:math';

import 'package:firebasetest/DiceGrid.dart';
import 'package:firebasetest/dropArea.dart';
import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  final rand = 0;
  final upperGrid = [0,0,0,0,0,0,0,0,0];
  final lowerGrid = [0,0,0,0,0,0,0,0,0];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          DiceGrid(grid: upperGrid,),
          DropArea(
            tts: "$rand",
          ),
          DiceGrid(grid : lowerGrid)
        ],
      ),
    );
  }
}

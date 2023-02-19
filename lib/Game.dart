import 'dart:math';
import 'package:firebasetest/DiceGrid.dart';
import 'package:firebasetest/dropArea.dart';
import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  GameState createState() => GameState();
}

class GameState extends State<Game> {
  int rand = 0;
  bool visable = true;
  bool upperTurn = true;
  List upperGrid = [
    [0, 0, 0],
    [0, 0, 0],
    [0, 0, 0]
  ];
  List lowerGrid = [
    [0, 0, 0],
    [0, 0, 0],
    [0, 0, 0]
  ];

  void throwDice() async {
    setState(() {
      //upperTurn = !upperTurn;
      visable = false;
    });
    rand = Random().nextInt(5) + 1;

    await Future.delayed(const Duration(milliseconds: 200));
    setState(() {
      visable = true;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DiceGrid(
          grid: upperGrid,
          turn: upperTurn,
        ),
        Flexible(
          child: GestureDetector(
            onTap: () => throwDice(),
            child: AnimatedScale(
              duration: const Duration(milliseconds: 100),
              scale: visable ? 1 : 0.9,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 100),
                opacity: visable ? 1 : 0.5,
                child: DropArea(
                  tts: "$rand",
                ),
              ),
            ),
          ),
        ),
        DiceGrid(
          grid: lowerGrid,
          turn: !upperTurn,
        )
      ],
    );
    ;
  }
}

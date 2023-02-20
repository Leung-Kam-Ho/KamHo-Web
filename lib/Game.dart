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
  int rand = Random().nextInt(6) + 1;
  bool visable = true;
  bool upperTurn = true;
  bool diceHover = false;
  List<List<int>> sumList = [
    [0, 0, 0],
    [0, 0, 0]
  ];
  List board = [
    [
      [0, 0, 0],
      [0, 0, 0],
      [0, 0, 0]
    ],
    [
      [0, 0, 0],
      [0, 0, 0],
      [0, 0, 0]
    ]
  ];

  void weadAI() {
    final List grid = board[0];
    int AIRand;
    AIRand = Random().nextInt(3);
    while (!grid[AIRand].contains(0)) {
      AIRand = Random().nextInt(3);
    }
    updateGrid(AIRand, 0);
  }

  void calculateScore([int upDown = 1]) {
    List<int> row;
    for (int i = 0; i < 3; i++) {
      int sum = 0;
      row = board[upDown][i];
      for (int j = 0; j < 3; j++) {
        sum += row[j];
      }
      sumList[upDown][i] = sum;
    }
    print(sumList[upDown]);
  }

  void updateGrid(int position, [int upDown = 1]) {
    final List grid = board[upDown];

    if (!grid[position].contains(0)) {
    } else {
      setState(() {
        int index = grid[position].indexOf(0);
        grid[position][index] = rand;
        calculateScore(upDown);
        throwDice();
      });
      if (upDown == 1) {
      weadAI();
    }
    }
    
  }

  void throwDice([int test = 0]) {
    setState(() {
      board = board;
      if (test == 0) {
        rand = Random().nextInt(5) + 1;
      } else {
        rand = test;
      }
    });
  }

  void clearGrid() {
    setState(() {
      sumList = [
        for(int i in Iterable.generate(2))
        [for(int j in Iterable.generate(3)) 0],
        
      ];
      board = [
        for(int i in Iterable.generate(2))
        [for(int j in Iterable.generate(3)) 
        [for(int k in Iterable.generate(3))0]]
      ];
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
          clickOn: (p0) => {}, //(p0) => updateGrid(p0, 0),
          flip: true,
          grid: board[0],
          turn: upperTurn,
        ),
        Flexible(
          child: GestureDetector(
            onTap: () => clearGrid(),
            child: MouseRegion(
              onEnter: (event) => setState(() {
                diceHover = true;
              }),
              onExit: (event) => setState(() {
                diceHover = false;
              }),
              child: AnimatedScale(
                duration: const Duration(milliseconds: 100),
                scale: diceHover ? 1 : 0.9,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 100),
                  opacity: visable ? 1 : 0.5,
                  child: DropArea(
                    sumA: sumList[0],
                    sumB: sumList[1],
                    tts: "$rand",
                  ),
                ),
              ),
            ),
          ),
        ),
        DiceGrid(
          clickOn: (p0) => updateGrid(p0),
          flip: false,
          grid: board[1],
          turn: !upperTurn,
        )
      ],
    );
    ;
  }
}

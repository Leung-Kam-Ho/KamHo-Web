import 'package:firebasetest/tile.dart';
import 'package:flutter/material.dart';

class DiceGrid extends StatefulWidget {
  const DiceGrid({Key? key, required this.grid}) : super(key: key);
  final List grid;

  @override
  _DiceGridState createState() => _DiceGridState();
}

class _DiceGridState extends State<DiceGrid> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Center(
          child: GridView.count(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        children: [
          for (var i = 0; i < 9; i++)
            Tile(
              tts: "${widget.grid[i]}",
            ),
        ],
      )),
    );
  }
}

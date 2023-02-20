import 'package:flutter/material.dart';

class ScoreBoard extends StatefulWidget {
  const ScoreBoard({Key? key, required this.grid}) : super(key: key);
  final List<int> grid;

  @override
  _ScoreBoardState createState() => _ScoreBoardState();
}

class _ScoreBoardState extends State<ScoreBoard> {
  

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        for (int i = 0; i < 3; i++)
          Padding(
            padding: const EdgeInsets.only(
                top: 8.0, bottom: 8.0, left: 20, right: 20),
            child: Text(
              "${widget.grid[i]}",
              style: TextStyle(
                  color: Theme.of(context).primaryColor, fontSize: 20),
            ),
          )
      ],
    );
  }
}

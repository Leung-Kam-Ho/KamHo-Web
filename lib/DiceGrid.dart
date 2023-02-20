import 'package:firebasetest/tile.dart';
import 'package:flutter/material.dart';

class DiceGrid extends StatefulWidget {
  const DiceGrid(
      {Key? key,
      required this.flip,
      required this.grid,
      required this.turn,
      required this.clickOn})
      : super(key: key);
  final List grid;
  final bool turn;
  final bool flip;
  final Function(int) clickOn;

  @override
  _DiceGridState createState() => _DiceGridState();
}

class _DiceGridState extends State<DiceGrid> {
  List isHover = [false, false, false];
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Center(
        child: Transform(
          alignment: Alignment.center,
          transform:
              widget.flip ? Matrix4.rotationX(3.14) : Matrix4.rotationX(0),
          child: Container(
            color: widget.turn
                ? Theme.of(context).canvasColor //Theme.of(context).primaryColor
                : Theme.of(context).canvasColor,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              for (int i = 0; i < 3; i++)
                Expanded(
                  child: MouseRegion(
                      onEnter: (event) {
                        setState(() {
                          isHover[i] = true;
                        });
                      },
                      onExit: (event) {
                        setState(() {
                          isHover[i] = false;
                        });
                      },
                      child: GestureDetector(
                        onTap: () => widget.clickOn(i),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 100),
                            color: isHover[i]
                                ? Theme.of(context).primaryColor
                                : Theme.of(context).canvasColor,
                            child: AnimatedScale(
                              duration: const Duration(milliseconds: 100),
                              scale: isHover[i] ? 1.02 : 1,
                              child: Column(
                                children: [
                                  for (int j = 0; j < 3; j++)
                                    Expanded(
                                        child: Tile(
                                      tts: "${widget.grid[i][j]}",
                                    )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )),
                )
            ]),
          ),
        ),
      ),
    );
  }
}

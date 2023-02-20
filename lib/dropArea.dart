import 'package:firebasetest/scoreBoard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DropArea extends StatefulWidget {
  const DropArea({Key? key, required this.sumA,required this.sumB,String this.tts = ""}) : super(key: key);
  final String tts;
  final List<int> sumA;
  final List<int> sumB;
  @override
  _DropAreaState createState() => _DropAreaState();
}

class _DropAreaState extends State<DropArea> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ScoreBoard(grid: widget.sumA),

            Expanded(
              child: Stack(
                fit: StackFit.expand,
                          alignment: AlignmentDirectional.center,
                          children: [
                            Container(color: Theme.of(context).canvasColor),
                            Container(child: SvgPicture.asset(
                                "MaterialDesign/dice-${widget.tts}.svg"
                              ,colorFilter: ColorFilter.mode(
                          Theme.of(context).primaryColor, BlendMode.srcIn),
                          
                          ),)
                          ]
                        ),
            ),
            ScoreBoard(grid: widget.sumB),
          ],
        )
          
      
      );
  }
}

import 'package:flutter/material.dart';

class Tile extends StatefulWidget {
  const Tile({
    Key? key,
    this.tts = "",
  }) : super(key: key);
  final String tts;
  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<Tile> {
  
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(5.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          child: Container(
            color: Theme.of(context).primaryColor,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      
                      Container(
                          color:Theme.of(context).canvasColor),
                      Text(widget.tts == "0" ? "" : widget.tts, 
                      style: TextStyle(color: Colors.white, fontSize: 30),
                      textAlign: TextAlign.center,)
                      
                    ],
                  )),
            ),
          ),
        ),
      );
  }
}

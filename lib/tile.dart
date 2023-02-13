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
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHover = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHover = false;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
                          color: isHover
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).canvasColor),
                      Text(widget.tts == "0" ? "" : widget.tts, 
                      style: TextStyle(color: Colors.white, fontSize: 30),
                      textAlign: TextAlign.center,)
                      
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}

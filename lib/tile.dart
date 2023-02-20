import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          borderRadius: BorderRadius.all(Radius.circular(15)),
          child: Container(
            color: Theme.of(context).primaryColor,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  child: Stack(
                    fit: StackFit.expand,
                    alignment: AlignmentDirectional.center,
                    children: [
                      
                      Container(
                          color:Theme.of(context).canvasColor),
                      Container(

                        child: widget.tts != "0" ? 
                        SvgPicture.asset(
                          "MaterialDesign/dice-${widget.tts}.svg"
                        ,colorFilter: ColorFilter.mode(
                    Theme.of(context).primaryColor, BlendMode.srcIn),
                    
                    ):Container()),
                      
                      
                      
                    ],
                  )),
            ),
          ),
        ),
      );
  }
}

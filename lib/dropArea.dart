import 'package:flutter/material.dart';

class DropArea extends StatefulWidget {
  const DropArea({Key? key, String this.tts = ""}) : super(key: key);
  final String tts;
  @override
  _DropAreaState createState() => _DropAreaState();
}

class _DropAreaState extends State<DropArea> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Container(color: Theme.of(context).canvasColor),
                      Text(
                        widget.tts,
                        style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 100),
                        textAlign: TextAlign.center,
                      )
                    ]
                  )
          
      
      );
  }
}

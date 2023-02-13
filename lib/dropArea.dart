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
    return Flexible(
      flex: 1,
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
                      Container(color: Theme.of(context).canvasColor),
                      Text(
                        widget.tts,
                        style: TextStyle(color: Colors.white, fontSize: 100),
                        textAlign: TextAlign.center,
                      )
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}

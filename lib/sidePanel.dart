import 'package:flutter/material.dart';

class SidePanel extends StatefulWidget {
  const SidePanel({Key? key}) : super(key: key);

  @override
  _SidePanelState createState() => _SidePanelState();
}

class _SidePanelState extends State<SidePanel> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100,
        alignment: Alignment.topCenter,
        color: Colors.transparent,
        child:  Text("=",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30))
      );
  }
}

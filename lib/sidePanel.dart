import 'package:flutter/material.dart';

class SidePanel extends StatefulWidget {
  const SidePanel({Key? key}) : super(key: key);

  @override
  _SidePanelState createState() => _SidePanelState();
}

class _SidePanelState extends State<SidePanel> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(topRight: Radius.circular(5),bottomRight: Radius.circular(5)),
      child: Container(
        width: 200,
        color: Colors.black,
      ),
    );
  }
}

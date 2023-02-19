import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SidePanel extends StatefulWidget {
  const SidePanel({
    Key? key,
    required this.onPop,
  }) : super(key: key);
  final VoidCallback onPop;
  @override
  _SidePanelState createState() => _SidePanelState();
}

class _SidePanelState extends State<SidePanel> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: 100,
          alignment: Alignment.topCenter,
          color: Colors.transparent,
          child: IconButton(
              // Use the MdiIcons class for the IconData
              icon: SvgPicture.asset(
                "MaterialDesign/MenuBar.svg",
                colorFilter: ColorFilter.mode(
                    Theme.of(context).primaryColor, BlendMode.srcIn),
              ),
              onPressed: widget.onPop,
              )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SidePanel extends StatefulWidget {
  const SidePanel({Key? key}) : super(key: key);

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
        icon: SvgPicture.asset("MaterialDesign/menu_FILL0_wght400_GRAD200_opsz48.svg"), 
        onPressed: () { 
          print('Using the sword'); }
       )),
    );
  }
}

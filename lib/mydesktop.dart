import 'package:firebasetest/GameArea.dart';
import 'package:firebasetest/Rule.dart';
import 'package:firebasetest/messageBox.dart';

import 'package:flutter/material.dart';
import 'sidePanel.dart';

class Mydesktop extends StatefulWidget {
  const Mydesktop({Key? key}) : super(key: key);

  @override
  MydesktopState createState() => MydesktopState();
}

class MydesktopState extends State<Mydesktop> {
  bool showMessageBox = false;

  void onp() {
    setState(() {
      showMessageBox = !showMessageBox;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      color: Theme.of(context).canvasColor,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.all(8 + MediaQuery.of(context).padding.top),
          child: Row(
            children: [
              SidePanel(onPop: onp),
              Expanded(
                  child: Padding(
                padding:
                    EdgeInsets.only(left: MediaQuery.of(context).padding.top),
                child: const Rule(),
              )),
              Padding(
                padding: const EdgeInsets.all(8),
                child: RotatedBox(
                  quarterTurns: 3,
                  child: Text(
                    "KNUCKLEBONES",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3.0),
                  ),
                ),
              ),
              MouseRegion(
                  onEnter: (event) => setState(() {
                        //ruleMode = true;
                      }),
                  onExit: (event) => setState(() {
                        //ruleMode = false;
                      }),
                  child: const ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      child: GameArea())),
            ],
          ),
        ),
      ),
    );
  }
}

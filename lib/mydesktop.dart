import 'package:firebasetest/GameArea.dart';
import 'package:firebasetest/messageBox.dart';

import 'send.dart';
import 'firebase_controller.dart';
import 'package:flutter/material.dart';
import 'sidePanel.dart';

class Mydesktop extends StatefulWidget {
  const Mydesktop({Key? key}) : super(key: key);

  @override
  _MydesktopState createState() => _MydesktopState();
}

class _MydesktopState extends State<Mydesktop> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      /*appBar: AppBar(
        title: const Text('Firebase App'),
        
      ),*/
      body: Padding(
        padding: EdgeInsets.all(8+ MediaQuery.of(context).padding.top),
        child: Row(
          children: [
            //SidePanel(),
            const Flexible(
              flex: 3,
              child: GameArea()
              ),
            Flexible(
              flex: 1,
              child: 
                Padding(
                  padding: EdgeInsets.only(left:MediaQuery.of(context).padding.top),
                  child: MessageBox(),
                ))

            
          ],
        ),
      ),
    );
  }
}

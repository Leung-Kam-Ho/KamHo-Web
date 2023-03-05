

import 'Rule.dart';
import 'send.dart';
import 'firebase_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Mymobile extends StatefulWidget {
  const Mymobile({ Key? key }) : super(key: key);

  @override
  _MymobileState createState() => _MymobileState();
}

class _MymobileState extends State<Mymobile> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Theme.of(context).canvasColor),
    );
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      /*appBar: AppBar(
        title: const Text('Firebase App'),
        
      ),*/
      body:Padding(
                padding:
                    EdgeInsets.only(left: MediaQuery.of(context).padding.top),
                  
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Rule(),
                ),
              )
    );
  }
}
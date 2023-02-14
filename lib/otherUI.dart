import 'package:firebasetest/messageBox.dart';
import 'package:flutter/material.dart';


class OtherUI extends StatefulWidget {
  const OtherUI({ Key? key }) : super(key: key);

  @override
  _OtherUIState createState() => _OtherUIState();
}

class _OtherUIState extends State<OtherUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      /*appBar: AppBar(
        title: const Text('Firebase App'),
        
      ),*/
      body: const Center(child: MessageBox(),)
      );
  }
}
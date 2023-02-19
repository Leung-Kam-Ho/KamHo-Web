import 'package:firebasetest/send.dart';
import 'package:flutter/material.dart';

import 'firebase_controller.dart';

class MessageBox extends StatefulWidget {
  const MessageBox({Key? key}) : super(key: key);

  @override
  _MessageBoxState createState() => _MessageBoxState();
}

class _MessageBoxState extends State<MessageBox> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: const <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Text(
            "MESSAGE BOARD",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ),
        Send(),
        //CardView(message: temp.length.toString()),
        FirebaseController()
      ],
    );
  }
}

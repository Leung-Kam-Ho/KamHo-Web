
import 'send.dart';
import 'firebase_controller.dart';
import 'package:flutter/material.dart';

class Mymobile extends StatefulWidget {
  const Mymobile({ Key? key }) : super(key: key);

  @override
  _MymobileState createState() => _MymobileState();
}

class _MymobileState extends State<Mymobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 230, 97),
      /*appBar: AppBar(
        title: const Text('Firebase App'),
        
      ),*/
      body: Padding(
        
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "Messege Board",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
            Send(),
            //CardView(message: temp.length.toString()),
            FirebaseController()
          ],
        ),
      ),
    );
  }
}
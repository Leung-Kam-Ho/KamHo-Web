import 'package:firebase_database/firebase_database.dart';
import 'package:firebasetest/send.dart';
import 'package:flutter/material.dart';
import "card.dart";

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _displayMessage = '';
  final databaseReference = FirebaseDatabase.instance.ref();
  List temp = [];
  @override
  void initState() {
    super.initState();
    databaseReference.onValue.listen((event) {
      setState(() {
        temp = [];
      });
    });
    databaseReference.onValue.listen((event) {
      setState(() {
        try {
          final data = event.snapshot.value as Map;
          _displayMessage = '';
          temp = [];
          data["Testing"].forEach((key, value) {
            //print("${key} + ${value}");
            setState(() {
              temp.add([
                value["message"],
                value['TimeStamp'].toString(),
                value["id"]
              ]);
            });
            //print(temp);
          });
        } catch (_) {
          _displayMessage = "We Will be Right Back";
        }
      });
    });
  }

  void del(String index) {
    databaseReference.child("Testing").child(index).remove();
  }

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
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text(
              "Messege Board",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Send(),
            //CardView(message: temp.length.toString()),
            Expanded(
              child: temp.length > 0 ? ListView.builder(
                padding: EdgeInsets.all(10),
                shrinkWrap: true,
                itemCount: temp.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => del(temp[index][2]),
                    child: CardView(
                      message: temp[index],
                    ),
                  );
                },
              ) : Text("None"),
            )
          ],
        ),
      ),
    );
  }
}

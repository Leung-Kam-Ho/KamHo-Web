import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'card.dart';

class FirebaseController extends StatefulWidget {
  const FirebaseController({Key? key}) : super(key: key);

  @override
  _FirebaseControllerState createState() => _FirebaseControllerState();
}

class _FirebaseControllerState extends State<FirebaseController> {
  final databaseReference = FirebaseDatabase.instance.ref();
  List temp = [];
  List tempHover = [];

  bool visible = true;

  Future<void> refresh(DatabaseEvent event) async {
    try {
      final data = event.snapshot.value as Map;
      temp = [];
      tempHover = [];
      data["Testing"].forEach((key, value) {
        setState(() {
          tempHover.add(false);
          temp.add(
              [value["message"], value['TimeStamp'].toString(), value["id"]]);
          //visible = true;
        });
      });
    } catch (_) {}
    await Future.delayed(const Duration(milliseconds: 300));
    setState(() {
      visible = true;
    });
  }

  Future<void> firebaseInit() async {
    //visible = false;
    DatabaseEvent event = await databaseReference.once();
    refresh(event);
  }

  @override
  void initState() {
    super.initState();
    firebaseInit();

    databaseReference.onValue.listen((event) {
      setState(() {
        temp = [];
      });
    });
    databaseReference.onValue.listen((event) {
      //visible = false;
      setState(() {
        visible = false;
      });
      refresh(event);
    });
  }

  void del(String index) {
    databaseReference.child("Testing").child(index).remove();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: temp.length > 0
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 0; i < temp.length; i++)
                      MouseRegion(
                        onEnter: (event) => setState(() {
                          tempHover[i] = true;
                        }),
                        onExit: (event) => setState(() {
                          tempHover[i] = false;
                        }),
                        child: AnimatedScale(
                          duration: Duration(milliseconds: 100),
                          scale: tempHover[i]? 1.1 : 1,
                          child: GestureDetector(
                              onTap: () => del("${temp[i][2]}"),
                              child: CardView(message: temp[i])),
                        ),
                      )
                  ],
                ),
              )
            : Text("No Message"));
  }
}

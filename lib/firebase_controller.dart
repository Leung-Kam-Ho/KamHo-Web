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

  void refresh(DatabaseEvent event) {
    try {
      final data = event.snapshot.value as Map;
      temp = [];
      data["Testing"].forEach((key, value) {
        setState(() {
          temp.add(
              [value["message"], value['TimeStamp'].toString(), value["id"]]);
        });
      });
    } catch (_) {
    }
  }

  Future<void> firebaseInit() async {
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
      setState(() {
        refresh(event);
      });
    });
  }

  void del(String index) {
    databaseReference.child("Testing").child(index).remove();
  }

  @override
  Widget build(BuildContext context) {
    
    return Expanded(
      child: temp.length > 0
          ? ListView.builder(
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
            )
          : CardView(message: ["Welcome","hi"]),
    );
    
  }
}

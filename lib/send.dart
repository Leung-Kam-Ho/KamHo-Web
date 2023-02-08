import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Send extends StatefulWidget {
  const Send({Key? key}) : super(key: key);

  @override
  _SendState createState() => _SendState();
}

class _SendState extends State<Send> {
  String _message = "";
  final databaseReference = FirebaseDatabase.instance.ref();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _message = value;
                  print(_message);
                });
              },
            ),
          ),
          Container(
            child: MaterialButton(
              onPressed: () async {
                if (_message.isNotEmpty) {
                  String key =
                      databaseReference.child("Testing").push().key ?? "er";
                  DateTime now = DateTime.now();
                  await databaseReference.child("Testing").child(key).set({
                    'id': key,
                    'message': _message,
                    'TimeStamp':
                        "${now.year.toString()}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}",
                  });
                }
              },
              child: const Text(
                'Send', 
                style: TextStyle(
                  color :Colors.white, fontWeight: FontWeight.bold),),
            ),
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: const BorderRadius.all(Radius.circular(25))),
          ),
        ],
      ),
    );
  }
}

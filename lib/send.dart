import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Send extends StatefulWidget {
  const Send({Key? key,}) : super(key: key);
  
  @override
  SendState createState() => SendState();
}

class SendState extends State<Send> {
  final sendTF = TextEditingController();
  String _message = "";
  final databaseReference = FirebaseDatabase.instance.ref();

  void clearText() {
    sendTF.clear();
    _message = "";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: sendTF,
              onChanged: (value) {
                setState(() {
                  _message = value;
                });
              },
            ),
          ),
          IconButton(
              // Use the MdiIcons class for the IconData
              icon: SvgPicture.asset("MaterialDesign/AddBox.svg"),
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
                  clearText();
                }
              }),
        ],
      ),
    );
  }
}

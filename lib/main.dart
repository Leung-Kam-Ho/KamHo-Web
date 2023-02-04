import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final databaseReference = FirebaseDatabase.instance.ref("Testing");

  String _message = '';
  String _displayMessage = '';
  int count = 0;

  @override
  void initState() {
    super.initState();
    databaseReference.onValue.listen((event) {
      setState(() {
        count++;
        final data = event.snapshot.value as Map;
        _displayMessage = "Message: ${data["message"]} \nTime: ${data['TimeStamp'].toString()}";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase App'),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              setState(() {
                _message = value;
              });
            },
          ),
          MaterialButton(
            onPressed: () async {
              await databaseReference.set({
                'message': _message,
                'TimeStamp' : "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
              });
            },
            child: const Text('Send'),
          ),
          Text(_displayMessage)
        ],
      ),
    );
  }
}

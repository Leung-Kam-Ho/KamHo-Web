import "hm.dart";
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
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
      theme: ThemeData(
        fontFamily: 'NotoSans',
        
        //primarySwatch: Colors.yellow,
        primaryColor: Color.fromARGB(255, 255, 255, 255),
        canvasColor: const Color.fromARGB(255, 37, 37, 37),
        hintColor: Color.fromARGB(255, 134, 134, 134),
        highlightColor: Color.fromARGB(255, 13, 224, 150)

      ),
      title: 'Kam Ho',
      home: MyHomePage(),
    );
  }
}

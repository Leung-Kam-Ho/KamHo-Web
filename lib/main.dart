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

          //primarySwatch: Colors.yellow,
          primaryColor: Color.fromARGB(255, 248, 239, 155),
          canvasColor: Colors.black,
          scaffoldBackgroundColor: Color.fromARGB(255, 248, 239, 155)),
          
          
      title: 'Kam Ho',

      home: MyHomePage(),
    );
  }
}

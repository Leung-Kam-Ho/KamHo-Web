import 'mydesktop.dart';
import 'mymobile.dart';
import 'Responsive_layout.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(mobile: Mymobile(), desktop: Mydesktop());
  }
}

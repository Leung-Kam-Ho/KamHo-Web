import 'package:flutter/material.dart';

class Rule extends StatefulWidget {
  const Rule({ Key? key }) : super(key: key);

  @override
  _RuleState createState() => _RuleState();
}

class _RuleState extends State<Rule> {
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text("Blah Blah Blah", 
      
      style: TextStyle(
        color: Theme.of(context).primaryColor,
        fontSize: 50,
        fontWeight: FontWeight.bold,
        
      ),)
    )
    ;
  }
}
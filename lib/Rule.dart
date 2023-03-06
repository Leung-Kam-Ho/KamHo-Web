import 'package:firebasetest/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Rule extends StatefulWidget {
  const Rule({Key? key}) : super(key: key);

  @override
  _RuleState createState() => _RuleState();
}

class _RuleState extends State<Rule> {
  var text = "Somethimes you have to tell her highlight all keywords";
  final sendTF = TextEditingController();
  String _message = "";

  var MSG = [
    {"role": "system", "content": "enclose all keywords with *"}
  ];
  Future<void> generateText(String prompt) async {
    if (prompt.toUpperCase() == "CLEAR") {
      MSG = [
        {"role": "system", "content": "enclose all keywords with *"}
      ];
      setState(() {
        text = "Cleared";
      });
    } else {
      var url = Uri.parse('https://api.openai.com/v1/chat/completions');
      var apiKey = "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";
      MSG.add({"role": "user", "content": "$prompt"});
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      };
      var body = jsonEncode({"model": "gpt-3.5-turbo", "messages": MSG});
      var response = await http.post(url, headers: headers, body: body);
      var data = jsonDecode(response.body);
      setState(() {
        text = data["choices"][0]["message"]["content"];
        MSG.add({"role": "assistant", "content": text});
      });
    }
  }

  void clearText() {
    sendTF.clear();
    _message = "";
  }

  void goGPTgo() {
    _message = sendTF.text;
    setState(() {
      text = "Loading... ";
    });
    generateText(_message);
    clearText();
  }

  List<TextSpan> _buildTextSpans(String text) {
    final regex = RegExp(r'\*(.*?)\*');

    final matches = regex.allMatches(text);

    List<TextSpan> spans = [];

    int currentIndex = 0;

    for (Match match in matches) {
      final matchStart = match.start;
      final matchEnd = match.end;

      // Add a TextSpan for the text before the match.
      if (currentIndex != matchStart) {
        final beforeMatch = text.substring(currentIndex, matchStart);
        spans.add(TextSpan(
          text: beforeMatch,
        ));
      }

      // Add a TextSpan for the matched text.
      final matchedText = match.group(1);
      spans.add(TextSpan(
        text: matchedText,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).highlightColor,
        ),
      ));

      // Update the current index to the end of the match.
      currentIndex = matchEnd;
    }

    // Add a TextSpan for the remaining text after the last match.
    if (currentIndex < text.length) {
      final remainingText = text.substring(currentIndex);
      spans.add(TextSpan(text: remainingText));
    }

    return spans;
  }

  @override
  Widget build(BuildContext context) {
    final max = 30.0;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    var fontSize = screenWidth * 0.05;
    if (fontSize > max) {
      fontSize = max;
    }
    return Column(
      children: [
        Expanded(
          child: Center(
            child: SingleChildScrollView(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 100),
                child: SelectableText.rich(
                  TextSpan(
                      text: '',
                      children: _buildTextSpans(text),
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: fontSize,
                      )),
                      
                  key: UniqueKey(),
                ),
              ),
            ),
          ),
        ),
        Center(
          child: Row(children: [
            Expanded(
              child: TextField(
                onEditingComplete: () {
                  //FocusScope.of(context).requestFocus(FocusNode());
                  goGPTgo();
                },
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                    filled: false,
                    hintText:
                        "'Enter' some text ,'Clear' her memory",
                    hintStyle: TextStyle(color: Theme.of(context).hintColor),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    )),
                controller: sendTF,
              ),
            ),
          ]),
        ),
      ],
    );
  }
}

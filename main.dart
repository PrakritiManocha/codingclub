import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CalculatorHomePage(),
    );
  }
}

class CalculatorHomePage extends StatefulWidget {
  @override
  _CalculatorHomePageState createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  String displayText = '';
  String resultText = '';

  Widget buildButton(String text, {Color color = Colors.grey, Color textColor = Colors.white}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            padding: EdgeInsets.all(20.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          onPressed: () {
            setState(() {
              if (text == 'C') {
                displayText = '';
                resultText = '';
              } else {
                displayText += text;
              }
            });
          },
          child: Text(
            text,
            style: TextStyle(fontSize: 24, color: textColor),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        backgroundColor: Colors.black87,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.black,
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    displayText,
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  Text(
                    resultText,
                    style: TextStyle(color: Colors.greenAccent, fontSize: 48),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  buildButton('7', color: Colors.grey[850]!),
                  buildButton('8', color: Colors.grey[850]!),
                  buildButton('9', color: Colors.grey[850]!),
                  buildButton('/', color: Colors.orange, textColor: Colors.white),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton('4', color: Colors.grey[850]!),
                  buildButton('5', color: Colors.grey[850]!),
                  buildButton('6', color: Colors.grey[850]!),
                  buildButton('*', color: Colors.orange, textColor: Colors.white),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton('1', color: Colors.grey[850]!),
                  buildButton('2', color: Colors.grey[850]!),
                  buildButton('3', color: Colors.grey[850]!),
                  buildButton('-', color: Colors.orange, textColor: Colors.white),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton('0', color: Colors.grey[850]!),
                  buildButton('C', color: Colors.red, textColor: Colors.white),
                  buildButton('=', color: Colors.green, textColor: Colors.white),
                  buildButton('+', color: Colors.orange, textColor: Colors.white),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

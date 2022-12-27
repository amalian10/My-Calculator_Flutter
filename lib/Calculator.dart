import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String output = "0";

  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText) {
    if (buttonText == "CLEAR") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "X") {
      num1 = double.parse(output);

      operand = buttonText;

      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        print("Already conatains a decimals");
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);

      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "X") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }

    print(_output);

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildButton(String buttonText) {
    return new Expanded(
      child: TextButton(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 58, 90, 64),
            ),
          ),
        ),
        onPressed: () => buttonPressed(buttonText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Container(
            child: new Column(
      children: <Widget>[
        SizedBox(
          height: 100,
        ),
        new Container(
            alignment: Alignment.centerRight,
            padding: new EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
            child: new Text(output,
                style: new TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ))),
        new Expanded(
          child: new Divider(),
        ),
        new Column(children: [
          new Row(children: [
            buildButton("7"),
            buildButton("8"),
            buildButton("9"),
            buildButton("/")
          ]),
          new Row(children: [
            buildButton("4"),
            buildButton("5"),
            buildButton("6"),
            buildButton("X")
          ]),
          new Row(children: [
            buildButton("1"),
            buildButton("2"),
            buildButton("3"),
            buildButton("-")
          ]),
          new Row(children: [
            buildButton("."),
            buildButton("0"),
            buildButton("00"),
            buildButton("+")
          ]),
          new Row(children: [
            buildButton("CLEAR"),
            buildButton("="),
          ])
        ])
      ],
    )));
  }
}
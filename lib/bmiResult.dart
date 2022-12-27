import 'package:flutter/material.dart';
import 'package:splashscreen/theame.dart';

class bmiResult extends StatelessWidget {
  final double height;
  final double weight;

  bmiResult({required this.height, required this.weight});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('YOUR RESULT'),
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Result(this.height, this.weight),
    );
  }
}

class Result extends StatefulWidget {
  final double height;
  final double weight;

  Result(this.height, this.weight);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width * 0.9,
            margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), color: primary),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("$headline", style: headlines),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                      '${BmiResult(this.widget.height, this.widget.weight)}',
                      style: resultNumber),
                ),
                Column(
                  children: <Widget>[
                    Text(
                      'Normal BMI range:',
                      style: headlines,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "18.5 - 25 kg/m",
                        style: headlines,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '$comment',
                    style: headlines,
                  ),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () => Navigator.pop(context),
          child: Container(
            color: primaryButtonColor,
            margin: EdgeInsets.only(top: 10.0),
            height: MediaQuery.of(context).size.height * 0.1,
            child: Center(
              child: Text('RE-CALCULATE', style: primaryButtonStyle),
            ),
          ),
        ),
      ],
    );
  }
}

var comment = '';
var headline = '';
BmiResult(h, w) {
  double bmi = (w / (h * h)) * 10000;

  if (bmi < 18.5) {
    comment = "YOUR RESULT IS UNDERWEIGHT";
    headline = "BODY MASS INDEX";
  } else if (bmi >= 18.5 && bmi < 25) {
    comment = "YOUR RESULT IS NORMAL";
    headline = "BODY MASS INDEX";
  } else if (bmi >= 25 && bmi <= 29.99) {
    comment = "YOUR RESULT IS OVERWEIGHT";
    headline = "BODY MASS INDEX";
  } else {
    comment = "YOUR RESULT IS OBESE";
    headline = "BODY MASS INDEX";
  }

  return bmi.round();
}

import 'dart:math';

import 'bmiResult.dart';
import 'package:flutter/material.dart';

class BMI extends StatefulWidget {
  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  bool isMale = true;
  double height = 180.0;
  double weight = 40.0;
  // double age = 18;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF030310),
        title: Center(
          child: Text(
            'BMI Calculator',
          ),
        ),
      ),
      body: Container(
        color: Color(0xFF0d091d),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isMale = true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: isMale
                                ? Color.fromARGB(255, 214, 166, 174)
                                : Color(0xFF0f1723),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage(
                                  'assets/images/male.png',
                                ),
                                color: Colors.white,
                                height: 65.0,
                                width: 65.0,
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                'MALE',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'roboto',
                                  color: Colors.white70,
                                  fontSize: 20.0,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isMale = false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: !isMale
                                ? Color.fromARGB(255, 214, 166, 174)
                                : Color(0xFF0f1723),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage('assets/images/female.png'),
                                color: Colors.white,
                                height: 65.0,
                                width: 65.0,
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Text(
                                'FEMALE',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'roboto',
                                  color: Colors.white70,
                                  fontSize: 20.0,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                  //1
                ),
              ),
            ),
            

             Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xFF0f1723),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: 40.0,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '${height.round()}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 35.0,
                              color: Colors.white),
                        ),
                        Text(
                          'CM',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    Slider(
                      activeColor: Color.fromARGB(255, 214, 166, 174),
                      inactiveColor: Colors.white54,
                      //thumbColor: Color.fromARGB(255, 214, 166, 174),

                      value: height,
                      max: 250,
                      min: 70,
                      onChanged: (value) {
                        setState(() {
                          height = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            )),


            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xFF0f1723),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'WEIGHT',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: 40.0,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '${weight.round()}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 35.0,
                              color: Colors.white),
                        ),
                        Text(
                          'KG',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    Slider(
                      activeColor: Color.fromARGB(255, 214, 166, 174),
                      inactiveColor: Colors.white54,
                      //thumbColor: Color.fromARGB(255, 214, 166, 174),

                      value: weight,
                      max: 250,
                      min: 0,
                      onChanged: (value) {
                        setState(() {
                          weight = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            )),

            Container(
              width: double.infinity,
              height: 50.0,
              color: Colors.blue,
              child: MaterialButton(
                color: Color.fromARGB(255, 214, 166, 174),
                onPressed: () {
                  double result = weight / pow(height / 100, 2);
                  print(result);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => bmiResult(
                          weight: weight,
                          height: height
                       
                        ),
                      ));
                },
                child: Text(
                  'Calculate',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

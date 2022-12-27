import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class Time extends StatefulWidget {
  const Time({Key? key}) : super(key: key);

  @override
  State<Time> createState() => _TimeState();
}

class _TimeState extends State<Time> {
  String _firstMenu = "Choose";
  String _secondmenu = "Choose";
  double _conversionresult = 0.0;
  final TextEditingController _ctrlBerat = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DropdownButton<String>(
                hint: Text(_firstMenu),
                items: <String>['Sc', 'Min', 'H', 'D'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _firstMenu = value.toString();
                  });
                },
              ),
              const Text("To"),
              DropdownButton<String>(
                hint: Text(_secondmenu),
                items: <String>['Sc', 'Min', 'H', 'D'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _secondmenu = value.toString();
                  });
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: TextFormField(
              controller: _ctrlBerat,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: _firstMenu,
                  labelText: _firstMenu),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  if (_firstMenu == "Choose" || _secondmenu == "Choose") {
                    Fluttertoast.showToast(
                        msg: "Select time type first", timeInSecForIosWeb: 1);
                  } else {
                    if (_firstMenu == 'Sc') {
                      if (_secondmenu == 'Min') {
                        _conversionresult =
                            double.parse(_ctrlBerat.text) * 0.0166666667;
                      } else if (_secondmenu == 'H') {
                        _conversionresult =
                            double.parse(_ctrlBerat.text) * 0.0002777778;
                      } else if (_secondmenu == "D") {
                        _conversionresult =
                            double.parse(_ctrlBerat.text) * 0.0000115741;
                      } else {
                        _conversionresult =
                            double.parse(_ctrlBerat.text.toString());
                      }
                    } else if (_firstMenu == 'Min') {
                      if (_secondmenu == 'Sc') {
                        _conversionresult = double.parse(_ctrlBerat.text) * 60;
                      } else if (_secondmenu == 'H') {
                        _conversionresult =
                            double.parse(_ctrlBerat.text) * 0.0166666667;
                      } else if (_secondmenu == "D") {
                        _conversionresult =
                            double.parse(_ctrlBerat.text) * 0.0006944444;
                      } else {
                        _conversionresult =
                            double.parse(_ctrlBerat.text.toString());
                      }
                    } else if (_firstMenu == "H") {
                      if (_secondmenu == 'Sc') {
                        _conversionresult =
                            double.parse(_ctrlBerat.text) * 3600;
                      } else if (_secondmenu == 'Min') {
                        _conversionresult = double.parse(_ctrlBerat.text) * 60;
                      } else if (_secondmenu == "D") {
                        _conversionresult =
                            double.parse(_ctrlBerat.text) * 0.0416666667;
                      } else {
                        _conversionresult =
                            double.parse(_ctrlBerat.text.toString());
                      }
                    } else {
                      if (_secondmenu == 'Sc') {
                        _conversionresult =
                            double.parse(_ctrlBerat.text) * 86400;
                      } else if (_secondmenu == 'Min') {
                        _conversionresult =
                            double.parse(_ctrlBerat.text) * 1440;
                      } else if (_secondmenu == "H") {
                        _conversionresult = double.parse(_ctrlBerat.text) * 24;
                      } else {
                        _conversionresult =
                            double.parse(_ctrlBerat.text.toString());
                      }
                    }
                  }
                });
              },
              child: const Text("Convert"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Text(
                "Time Conversion Result",
                maxLines: 1,
                style: GoogleFonts.oswald(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Center(
            child: Text(
              _conversionresult.toString(),
              maxLines: 1,
              style:
                  GoogleFonts.oswald(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          )
        ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class Length extends StatefulWidget {
  const Length({Key? key}) : super(key: key);

  @override
  State<Length> createState() => _LengthState();
}

class _LengthState extends State<Length> {
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
                items: <String>['Km', 'm', 'Cm', 'Mm'].map((String value) {
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
                items: <String>['Km', 'm', 'Cm', 'Mm'].map((String value) {
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
                        msg: "Select distance type first",
                        timeInSecForIosWeb: 1);
                  } else {
                    if (_firstMenu == 'Km') {
                      if (_secondmenu == 'm') {
                        _conversionresult =
                            double.parse(_ctrlBerat.text) * 1000;
                      } else if (_secondmenu == 'Cm') {
                        _conversionresult =
                            double.parse(_ctrlBerat.text) * 1000000;
                      } else if (_secondmenu == "Mm") {
                        _conversionresult =
                            double.parse(_ctrlBerat.text) * 1000000000;
                      } else {
                        _conversionresult =
                            double.parse(_ctrlBerat.text.toString());
                      }
                    } else if (_firstMenu == 'm') {
                      if (_secondmenu == 'Km') {
                        _conversionresult =
                            double.parse(_ctrlBerat.text) * 0.001;
                      } else if (_secondmenu == 'Cm') {
                        _conversionresult = double.parse(_ctrlBerat.text) * 100;
                      } else if (_secondmenu == "Mm") {
                        _conversionresult =
                            double.parse(_ctrlBerat.text) * 1000;
                      } else {
                        _conversionresult =
                            double.parse(_ctrlBerat.text.toString());
                      }
                    } else if (_firstMenu == "Cm") {
                      if (_secondmenu == 'Km') {
                        _conversionresult =
                            double.parse(_ctrlBerat.text) * 0.00001;
                      } else if (_secondmenu == 'm') {
                        _conversionresult =
                            double.parse(_ctrlBerat.text) * 0.01;
                      } else if (_secondmenu == "Mm") {
                        _conversionresult = double.parse(_ctrlBerat.text) * 10;
                      } else {
                        _conversionresult =
                            double.parse(_ctrlBerat.text.toString());
                      }
                    } else {
                      if (_secondmenu == 'Km') {
                        _conversionresult =
                            double.parse(_ctrlBerat.text) * 0.000001;
                      } else if (_secondmenu == 'm') {
                        _conversionresult =
                            double.parse(_ctrlBerat.text) * 0.001;
                      } else if (_secondmenu == "Mm") {
                        _conversionresult = double.parse(_ctrlBerat.text) / 0.1;
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
                "Distance Conversion Result",
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

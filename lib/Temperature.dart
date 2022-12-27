import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class SuhuKonversi extends StatefulWidget {
  const SuhuKonversi({Key? key}) : super(key: key);

  @override
  State<SuhuKonversi> createState() => _SuhuKonversiState();
}

class _SuhuKonversiState extends State<SuhuKonversi> {
  String _firstMenu = "Choose";
  String _secondmenu = "Choose";
  double _conversionresult = 0.0;
  final TextEditingController _ctrlTemp = TextEditingController();
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
                items: <String>['C', 'F', 'K', 'R'].map((String value) {
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
                items: <String>['C', 'F', 'K', 'R'].map((String value) {
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
              controller: _ctrlTemp,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: _firstMenu,
                  labelText: _firstMenu),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 10),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  if (_firstMenu == "Choose" || _secondmenu == "Choose") {
                    Fluttertoast.showToast(
                        msg: "Select the temperature type first",
                        timeInSecForIosWeb: 1);
                  } else {
                    if (_firstMenu == 'C') {
                      if (_secondmenu == 'F') {
                        _conversionresult =
                            (9 / 5 * double.parse(_ctrlTemp.text)) + 32;
                      } else if (_secondmenu == 'R') {
                        _conversionresult =
                            4 / 5 * double.parse(_ctrlTemp.text);
                      } else if (_secondmenu == "K") {
                        _conversionresult = double.parse(_ctrlTemp.text) + 273;
                      } else {
                        _conversionresult =
                            double.parse(_ctrlTemp.text.toString());
                      }
                    } else if (_firstMenu == 'F') {
                      if (_secondmenu == 'C') {
                        _conversionresult =
                            5 / 9 * (double.parse(_ctrlTemp.text) - 32);
                      } else if (_secondmenu == 'K') {
                        _conversionresult =
                            (double.parse(_ctrlTemp.text) + 459.67) * 5 / 9;
                      } else if (_secondmenu == "R") {
                        _conversionresult =
                            (double.parse(_ctrlTemp.text) - 32) * 4 / 9;
                      } else {
                        _conversionresult =
                            double.parse(_ctrlTemp.text.toString());
                      }
                    } else if (_firstMenu == "K") {
                      if (_secondmenu == 'C') {
                        _conversionresult =
                            double.parse(_ctrlTemp.text) - 273.15;
                      } else if (_secondmenu == 'F') {
                        _conversionresult =
                            (double.parse(_ctrlTemp.text) - 273.15) * 9 / 5 +
                                32;
                      } else if (_secondmenu == "R") {
                        _conversionresult =
                            (double.parse(_ctrlTemp.text) - 273.15) * 4 / 5;
                      } else {
                        _conversionresult =
                            double.parse(_ctrlTemp.text.toString());
                      }
                    } else {
                      if (_secondmenu == 'C') {
                        _conversionresult =
                            double.parse(_ctrlTemp.text) * 5 / 4;
                      } else if (_secondmenu == 'F') {
                        _conversionresult =
                            (double.parse(_ctrlTemp.text) * 9 / 4) + 32;
                      } else if (_secondmenu == "K") {
                        _conversionresult =
                            (double.parse(_ctrlTemp.text) / 0.8) + 273.15;
                      } else {
                        _conversionresult =
                            double.parse(_ctrlTemp.text.toString());
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
                "Temperature Conversion Result",
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

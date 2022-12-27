import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class Weight extends StatefulWidget {
  const Weight({Key? key}) : super(key: key);

  @override
  State<Weight> createState() => _WeightState();
}

class _WeightState extends State<Weight> {
  String _menuPertama = "Choose";
  String _menukedua = "Choose";
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
                hint: Text(_menuPertama),
                items: <String>['Ton', 'Kg', 'g', 'Mg'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _menuPertama = value.toString();
                  });
                },
              ),
              const Text("To"),
              DropdownButton<String>(
                hint: Text(_menukedua),
                items: <String>['Ton', 'Kg', 'g', 'Mg'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _menukedua = value.toString();
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
                  hintText: _menuPertama,
                  labelText: _menuPertama),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  if (_menuPertama == "Choose" || _menukedua == "Choose") {
                    Fluttertoast.showToast(
                        msg: "Select weight type first", timeInSecForIosWeb: 1);
                  } else {
                    if (_menuPertama == 'Ton') {
                      if (_menukedua == 'Kg') {
                        _conversionresult =
                            double.parse(_ctrlBerat.text) * 1000;
                      } else if (_menukedua == 'g') {
                        _conversionresult =
                            double.parse(_ctrlBerat.text) * 1000000;
                      } else if (_menukedua == "Mg") {
                        _conversionresult =
                            double.parse(_ctrlBerat.text) * 1000000000;
                      } else {
                        _conversionresult =
                            double.parse(_ctrlBerat.text.toString());
                      }
                    } else if (_menuPertama == 'Kg') {
                      if (_menukedua == 'Ton') {
                        _conversionresult =
                            double.parse(_ctrlBerat.text) / 1000;
                      } else if (_menukedua == 'g') {
                        _conversionresult =
                            double.parse(_ctrlBerat.text) * 1000;
                      } else if (_menukedua == "Mg") {
                        _conversionresult =
                            double.parse(_ctrlBerat.text) * 1000000;
                      } else {
                        _conversionresult =
                            double.parse(_ctrlBerat.text.toString());
                      }
                    } else if (_menuPertama == "g") {
                      if (_menukedua == 'Ton') {
                        _conversionresult =
                            double.parse(_ctrlBerat.text) / 1000000;
                      } else if (_menukedua == 'Kg') {
                        _conversionresult =
                            double.parse(_ctrlBerat.text) / 1000;
                      } else if (_menukedua == "Mg") {
                        _conversionresult =
                            double.parse(_ctrlBerat.text) * 1000;
                      } else {
                        _conversionresult =
                            double.parse(_ctrlBerat.text.toString());
                      }
                    } else {
                      if (_menukedua == 'Ton') {
                        _conversionresult =
                            double.parse(_ctrlBerat.text) / 1000000000;
                      } else if (_menukedua == 'Kg') {
                        _conversionresult =
                            double.parse(_ctrlBerat.text) / 1000000;
                      } else if (_menukedua == "g") {
                        _conversionresult =
                            double.parse(_ctrlBerat.text) / 1000;
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
                "Weight Conversion Result",
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

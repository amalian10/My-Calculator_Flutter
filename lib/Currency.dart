import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class Currency extends StatefulWidget {
  const Currency({Key? key}) : super(key: key);

  @override
  State<Currency> createState() => _CurrencyState();
}

class _CurrencyState extends State<Currency> {
  String _firstMenu = "Choose";
  String _secondmenu = "Choose";
  double _hasilconversi = 0.0;
  final TextEditingController _ctrlCurrency = TextEditingController();
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
                items: <String>['IDR', 'USD', 'EUR', 'JPY'].map((String value) {
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
                items: <String>['IDR', 'USD', 'EUR', 'JPY'].map((String value) {
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
              controller: _ctrlCurrency,
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
                        msg: "Select currency type first", timeInSecForIosWeb: 1);
                  } else {
                    if (_firstMenu == 'IDR') {
                      if (_secondmenu == 'USD') {
                        _hasilconversi =
                            double.parse(_ctrlCurrency.text) * 0.000064;
                      } else if (_secondmenu == 'EUR') {
                        _hasilconversi =
                            double.parse(_ctrlCurrency.text) * 0.000060;
                      } else if (_secondmenu == "JPY") {
                        _hasilconversi =
                            double.parse(_ctrlCurrency.text) * 0.008497;
                      } else {
                        _hasilconversi =
                            double.parse(_ctrlCurrency.text.toString());
                      }
                    } else if (_firstMenu == 'USD') {
                      if (_secondmenu == 'IDR') {
                        _hasilconversi =
                            double.parse(_ctrlCurrency.text) * 15589.272749;
                      } else if (_secondmenu == 'EUR') {
                        _hasilconversi =
                            double.parse(_ctrlCurrency.text) * 1.0613097;
                      } else if (_secondmenu == "JPY") {
                        _hasilconversi =
                            double.parse(_ctrlCurrency.text) * 0.007529;
                      } else {
                        _hasilconversi =
                            double.parse(_ctrlCurrency.text.toString());
                      }
                    } else if (_firstMenu == "EUR") {
                      if (_secondmenu == 'IDR') {
                        _hasilconversi =
                            double.parse(_ctrlCurrency.text) * 16550.621459;
                      } else if (_secondmenu == 'USD') {
                        _hasilconversi =
                            double.parse(_ctrlCurrency.text) * 0.942232;
                      } else if (_secondmenu == "JPY") {
                        _hasilconversi =
                            double.parse(_ctrlCurrency.text) * 0.0070941;
                      } else {
                        _hasilconversi =
                            double.parse(_ctrlCurrency.text.toString());
                      }
                    } else {
                      if (_secondmenu == 'IDR') {
                        _hasilconversi =
                            double.parse(_ctrlCurrency.text) * 0.0070941;
                      } else if (_secondmenu == 'USD') {
                        _hasilconversi =
                            double.parse(_ctrlCurrency.text) * 132.819;
                      } else if (_secondmenu == "EUR") {
                        _hasilconversi =
                            double.parse(_ctrlCurrency.text) * 140.9621;
                      } else {
                        _hasilconversi =
                            double.parse(_ctrlCurrency.text.toString());
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
                "Currency Conversion Result",
                maxLines: 1,
                style: GoogleFonts.oswald(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Center(
            child: Text(
              _hasilconversi.toString(),
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
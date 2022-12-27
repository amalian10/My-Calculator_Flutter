import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Discount extends StatefulWidget {
  const Discount({Key? key}) : super(key: key);
  @override
  State<Discount> createState() => _DiscountState();
}

class _DiscountState extends State<Discount> {
  double _penilaian = 0.0;
  double harga_asli = 0.0;
  final TextEditingController _ctrlPrice = TextEditingController();
  final TextEditingController _ctrlDiscount = TextEditingController();

  void _menghitung() {
    harga_asli = double.parse(_ctrlPrice.text);
    _penilaian = int.parse(_ctrlDiscount.text) / 100 * harga_asli;
    _penilaian -= harga_asli;
    _penilaian *= -1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
              child: TextFormField(
                controller: _ctrlPrice,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                    hintText: "Price",
                    contentPadding: EdgeInsets.only(left: 20)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
              child: TextFormField(
                controller: _ctrlDiscount,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  hintText: "Discount",
                  contentPadding: EdgeInsets.only(left: 20),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                child: ElevatedButton(
                  child: const Text("Calculate"),
                  onPressed: () {
                    setState(() {
                      _menghitung();
                    });
                  },
                )),
            Padding(
                padding: const EdgeInsets.only(
                    top: 40, bottom: 30, left: 20, right: 20),
                child: Center(
                  child: Text(
                    "Saving : ${harga_asli - _penilaian}",
                    maxLines: 1,
                    style: GoogleFonts.oswald(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                )),
            Center(
              child: Text(
                "Price After Discount : " + _penilaian.toString(),
                maxLines: 1,
                style: GoogleFonts.oswald(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}

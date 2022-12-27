import 'package:flutter/material.dart';
import 'package:splashscreen/BMI.dart';
import 'package:splashscreen/Currency.dart';
import 'package:splashscreen/Length.dart';
import 'package:splashscreen/Time.dart';
import 'package:splashscreen/Weight.dart';
import 'package:splashscreen/header_drawer.dart';
import 'package:splashscreen/Calculator.dart';
import 'package:splashscreen/Temperature.dart';
import 'package:splashscreen/Discount.dart';

import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 214, 166, 174),
        title: const Text("My Calculator"),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const MyHeaderDrawer(),
              ListTile(
                leading: const Icon(Icons.people),
                title: const Text("Calculator"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Calculator()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.people),
                title: const Text("BMI Calculator"),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => BMI()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.people),
                title: const Text("Temperature"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SuhuKonversi()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.people),
                title: const Text("Weight"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Weight()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.people),
                title: const Text("Distance"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Length()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.people),
                title: const Text("Time"),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Time()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.people),
                title: const Text("Currency"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Currency()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.people),
                title: const Text("Discount"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Discount()));
                },
              ),
            ],
          ),
        ),
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(25),
        crossAxisCount: 2,
        children: <Widget>[
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Calculator()));
              },
              splashColor: Color.fromARGB(255, 214, 166, 174),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(
                      Icons.calculate_rounded,
                      size: 70,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    Text("Calculator", style: TextStyle(fontSize: 17.0)),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => BMI()));
              },
              splashColor: Color.fromARGB(255, 214, 166, 174),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(
                      Icons.monitor_weight_rounded,
                      size: 70,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    Text("BMI Calculator", style: TextStyle(fontSize: 17.0)),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SuhuKonversi()));
              },
              splashColor: Color.fromARGB(255, 214, 166, 174),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(
                      Icons.sunny,
                      size: 70,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    Text("Temperature", style: TextStyle(fontSize: 17.0)),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Weight()));
              },
              splashColor: Color.fromARGB(255, 214, 166, 174),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(
                      Icons.scale_outlined,
                      size: 70,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    Text("Weight", style: TextStyle(fontSize: 17.0)),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Length()));
              },
              splashColor: Color.fromARGB(255, 214, 166, 174),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(
                      Icons.linear_scale_sharp,
                      size: 70,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    Text("Distance", style: TextStyle(fontSize: 17.0)),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Time()));
              },
              splashColor: Color.fromARGB(255, 214, 166, 174),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(
                      Icons.punch_clock,
                      size: 70,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    Text("Time", style: TextStyle(fontSize: 17.0)),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Currency()));
              },
              splashColor: Color.fromARGB(255, 214, 166, 174),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(
                      Icons.attach_money,
                      size: 70,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    Text("Currency", style: TextStyle(fontSize: 17.0)),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Discount()));
              },
              splashColor: Color.fromARGB(255, 214, 166, 174),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(
                      Icons.percent,
                      size: 70,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    Text("Discount", style: TextStyle(fontSize: 17.0)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

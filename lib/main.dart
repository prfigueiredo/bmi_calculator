import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math';

void main() {
  runApp(const MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Controllers
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  //Default text
  String _information = "Type your weight(kilograms) and height(meters)";

  //A method that erases field information.
  void _resetButton() {
    setState(() {
      weightController.text = "";
      heightController.text = "";
      _information = "Type your weight(kilograms) and height(meters)";
    });
  }

  //A method that calculates Body Mass Index
  void _calculate(){
    setState(() {
      double weight = double.parse(weightController.text.replaceAll(',', '.'));
      double height = double.parse(heightController.text.replaceAll(',', '.'));

      double bmi = weight / pow(height, 2);

      if(bmi<18.5){
        _information = "You're underweight (BMI = ${bmi.toStringAsPrecision(4)}).";
      }else if(bmi>24.9){
        _information = "You're overweight (BMI = ${bmi.toStringAsPrecision(4)}). ";
      }else{
        _information = "You're at your ideal weight! (BMI = ${bmi.toStringAsPrecision(4)}). ";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Body Mass Index (BMI)"),
        centerTitle: true,
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
              onPressed: () {
                _resetButton();
              },
              icon: const Icon(Icons.refresh)),
          const SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Divider(),
            SvgPicture.asset(
              'assets/body.svg',
              height: 255,
            ),
            const Divider(),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "WEIGHT(kg)",
                labelStyle: TextStyle(
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black, fontSize: 25),
              controller: weightController,
            ),
            const Divider(),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "HEIGHT(m)",
                labelStyle: TextStyle(
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black, fontSize: 25),
              controller: heightController,
            ),
            const Divider(),
            SizedBox(
              height: 50,
              width: 50,
              child: ElevatedButton(
                onPressed: _calculate,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                child: const Text(
                  "CALCULATE",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Divider(),
            Text(
              _information,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.teal, fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}

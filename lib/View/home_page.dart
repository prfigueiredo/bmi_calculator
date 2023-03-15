import 'package:bmi_calculator/Model/model_page.dart';
import 'package:bmi_calculator/Presenter/presenter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//View - (MVP pattern)
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Instancing Model class (MVP pattern)
  Model textData = Model();
  //Instancing Presenter class (MVP pattern)
  Presenter controller = Presenter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(textData.staticDatas[0]),
        centerTitle: true,
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  controller.resetButton();
                });
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
              decoration: InputDecoration(
                labelText: textData.staticDatas[1],
                labelStyle: const TextStyle(
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black, fontSize: 25),
              controller: controller.weightController,
            ),
            const Divider(),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: textData.staticDatas[2],
                labelStyle: const TextStyle(
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black, fontSize: 25),
              controller: controller.heightController,
            ),
            const Divider(),
            SizedBox(
              height: 50,
              width: 50,
              child: ElevatedButton(
                onPressed: (){
                  setState(() {
                    controller.calculate();
                  });
                  },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                child: Text(
                  textData.staticDatas[3],
                  style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Divider(),
            Text(
              controller.information,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.teal, fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}

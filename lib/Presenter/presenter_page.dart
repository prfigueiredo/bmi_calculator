import 'dart:math';
import 'package:flutter/material.dart';

//Presenter - (MVP pattern)
class Presenter {
  //Controllers
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  //Default text
  String information = "Type your weight(kilograms) and height(meters)";

  //A method that erases field information.
  void resetButton() {

      weightController.text = "";
      heightController.text = "";
      information = "Type your weight(kilograms) and height(meters)";

  }

  //A method that calculates Body Mass Index
  void calculate(){
      double weight = double.parse(weightController.text.replaceAll(',', '.'));
      double height = double.parse(heightController.text.replaceAll(',', '.'));

      double bmi = weight / pow(height, 2);

      if(bmi<18.5){
        information = "You're underweight (BMI = ${bmi.toStringAsPrecision(4)}).";
      }else if(bmi>24.9){
        information = "You're overweight (BMI = ${bmi.toStringAsPrecision(4)}). ";
      }else{
        information = "You're at your ideal weight! (BMI = ${bmi.toStringAsPrecision(4)}). ";
      }
  }


}

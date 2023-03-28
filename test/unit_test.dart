import 'dart:math';
import 'package:flutter_test/flutter_test.dart';

//Unit Tests

void main() {
  group('testing BMI calculator', () {

    test('Positive numbers input', () {
    //setup
    double? weight = 78;
    double? height = 1.79;  
    //do
    double? bmi = weight/pow(height, 2);
    //test
    expect(bmi, closeTo(24.34, 0.01));
    }
   );

   test('Negative numbers input', () {
    //setup
    double? weight = -78;
    double? height = -1.79;  
    //do
    double? bmi = weight/pow(height, 2);
    //test
    expect(bmi, closeTo(-24.34, 0.01));
    }
   );
  
   });
}
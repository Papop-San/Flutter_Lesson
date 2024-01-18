import 'package:flutter/material.dart';

class Showresult extends StatelessWidget {
  final double ageResult;
  final double heightResult;
  final double weightResult;
  final String genderResult;

  Showresult({
    Key? key,
    required this.ageResult,
    required this.heightResult,
    required this.weightResult,
    required this.genderResult,
  }) : super(key: key);

  String getWeightLossMessage(double bmi) {
    if (bmi < 18.5) {
      return "You are underweight. Consider gaining weight.";
    } else if (bmi >= 18.5 && bmi < 22.9) {
      return "Your BMI is in a healthy range. Maintain your current weight.";
    } else if (bmi >= 23 && bmi < 24.9) {
      return "Your BMI indicates you are overweight. Consider losing weight.";
    } else if (bmi >= 25 && bmi < 29.9) {
      return "You are in the pre-obesity range. Consider losing weight.";
    } else {
      return "You are in the obesity range. Consider losing weight.";
    }
  }

  @override
  Widget build(BuildContext context) {
    double bmiCalculate =
        weightResult / ((heightResult / 100) * (heightResult / 100));
    double bmrCalculateMale = 66 +
        (13.7 * weightResult) +
        (5 * (heightResult / 100)) -
        (6.8 * ageResult);
    double bmrCalculateFemale = 665 +
        (9.6 * weightResult) +
        (1.8 * (heightResult / 100)) -
        (4.7 * ageResult);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "The result of BMI",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF43766C),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    genderResult == "Male"
                        ? 'assets/images/men.png'
                        : 'assets/images/women.png',
                    width: 200,
                    height: 200,
                  ),
                ),
              ],
            ),

            // BMI Calculate
            ListTile(
              contentPadding: EdgeInsets.only(bottom: 0.0),
              title: Text(
                "BMI: ${bmiCalculate.toStringAsFixed(2)}",
                textAlign: TextAlign.center,
              ),
            ),

            // BMR Calculate
            if (genderResult == "Male")
              ListTile(
                title: Text(
                  "BMR: ${bmrCalculateMale.toStringAsFixed(2)}",
                  textAlign: TextAlign.center,
                ),
              ),
            if (genderResult == "Female")
              ListTile(
                title: Text(
                  "BMR: ${bmrCalculateFemale.toStringAsFixed(2)}",
                  textAlign: TextAlign.center,
                ),
              ),

            // Image Creat
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (bmiCalculate < 18.5)
                  Image.asset(
                    'assets/images/bmi-1.png',
                    width: 200,
                    height: 300,
                  ),
                if (bmiCalculate >= 18.5 && bmiCalculate < 22.9)
                  Image.asset(
                    'assets/images/bmi-2.png',
                    width: 200,
                    height: 300,
                  ),
                if (bmiCalculate >= 23 && bmiCalculate < 24.9)
                  Image.asset(
                    'assets/images/bmi-3.png',
                    width: 200,
                    height: 300,
                  ),
                if (bmiCalculate >= 25 && bmiCalculate < 29.9)
                  Image.asset(
                    'assets/images/bmi-4.png',
                    width: 200,
                    height: 300,
                  ),
                if (bmiCalculate >= 30)
                  Image.asset(
                    'assets/images/bmi-5.png',
                    width: 200,
                    height: 300,
                  ),
              ],
            ),

            // Weight Loss Message
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                getWeightLossMessage(bmiCalculate),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

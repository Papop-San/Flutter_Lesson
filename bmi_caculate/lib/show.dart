import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Showresult extends StatelessWidget {
  final double ageResult;
  final double heightResult;
  final double weightResult;
  String  genderResult;

  Showresult({
    Key? key,
    required this.ageResult,
    required this.heightResult,
    required this.weightResult,
    required this.genderResult,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //BMI Caculate
    double bmiCaculate = weightResult / ((heightResult / 100) * (heightResult / 100));
    //BMR Caculate
    double bmrCaculateMale = 66+(13.7 *weightResult)+(5*(heightResult/100))-(6.8*ageResult);
    double bmrCaculateFemale = 665+(9.6 *weightResult)+(1.8*(heightResult/100))-(4.7*ageResult);
    



    return Scaffold(
      appBar: AppBar(
        title: Text(
          "The result of BMI",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF43766C),
      ),
      body: Center(
        child: ListView(
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
            // BMI Caculate
            if (genderResult == "Male")
              ListTile(
                leading: Icon(Icons.boy_outlined),
                title: Text("BMI: ${bmiCaculate.toStringAsFixed(2)}"),
              ),
            if (genderResult == "Female")
              ListTile(
                leading: Icon(Icons.girl_outlined),
                title: Text("BMI: ${bmiCaculate.toStringAsFixed(2)}"),
              ),

            // BMR Caculate
            if (genderResult == "Male")
              ListTile(
                leading: Icon(Icons.fire_hydrant_alt_outlined),
                title: Text("BMR: ${bmrCaculateMale.toStringAsFixed(2)}"),
              ),
            if (genderResult == "Female")
              ListTile(
                leading: Icon(Icons.fire_hydrant_alt_outlined),
                title: Text("BMR: ${bmrCaculateFemale.toStringAsFixed(2)}"),
              ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'dart:math';

class fromResult extends StatelessWidget {
  final double widthResult;
  final double heightResult;
  final double radiusResult;

  fromResult({
    Key? key,
    required this.widthResult,
    required this.heightResult,
    required this.radiusResult,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double areaResult = widthResult * heightResult;
    double perimeterResult = 2 * (widthResult + heightResult);
    double areacircleResult = 3.14 * pow(radiusResult, 2);
    double perimetercircleResult = 2 * 3.14 * radiusResult;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Result of Calculate",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF43766C),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            //Show result of Circle
            if (radiusResult > 0)
              ListTile(
                title: Text("Radius: $radiusResult"),
              ),
            if (radiusResult > 0) ...[
              ListTile(
                title: Text("Area Circle: $areacircleResult"),
              ),
              ListTile(
                title: Text("Perimeter Circle: $perimetercircleResult"),
              ),
            ],

            // Show result of  Square
            if (widthResult > 0)
              ListTile(
                title: Text("Width: $widthResult"),
              ),
            if (heightResult > 0)
              ListTile(
                title: Text("Height: $heightResult"),
              ),
            if (widthResult > 0 && heightResult > 0) ...[
              ListTile(
                title: Text("Square Area: $areaResult"),
              ),
              ListTile(
                title: Text("Perimeter: $perimeterResult"),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

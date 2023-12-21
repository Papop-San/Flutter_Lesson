import 'package:flutter/material.dart';
import './Moneybox.dart'; // assuming the file is named Moneybox.dart

class MoneyBox extends StatelessWidget {
  final String title;
  final double amount;
  final double sizeConHeight;
  final Color colorSet;

  MoneyBox(this.title, this.amount, this.sizeConHeight, this.colorSet);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account of Money"),
      ),
      backgroundColor: Colors.yellow,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            MoneyBox("Balance", 3150000, 120, Colors.lightBlue),
            MoneyBox("Income", 100000, 120, Colors.green),
            MoneyBox("Outcome", 1500, 120, Colors.red),
          ],
        ),
      ),
    );
  }
}

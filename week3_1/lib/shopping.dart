import 'package:flutter/material.dart';

class fromShopping extends StatelessWidget {
  final String productName;
  final String userName;
  final int totalPrice; // Correct the variable name here

  fromShopping({
    Key? key,
    required this.productName,
    required this.userName,
    required this.totalPrice, // Correct the variable name here
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping Text"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.account_balance_wallet_outlined),
              title: Text("Product: $productName"),
              subtitle: Text("Name: $userName"),
            ),
            ListTile(
              leading: Icon(Icons.price_check_outlined),
              title: Text("Price of Product: $totalPrice"),
            ),
            // Add more ListTile widgets for additional items if needed
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class fromShopping extends StatelessWidget {
  final String productName;
  final String userName;
  

  fromShopping({
    Key? key,
    required this.productName,
    required this.userName,
    
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
            
            // Add more ListTile widgets for additional items if needed
          ],
        ),
      ),
    );
  }
}

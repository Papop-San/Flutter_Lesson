import 'package:flutter/material.dart';

class FromShopping extends StatelessWidget {
  final String productName;
  final String productDes;

  FromShopping({Key? key, required this.productName, required this.productDes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping Screen"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: ListView(children: [
          ListTile(
            leading: Icon(Icons.account_balance_wallet_outlined),
            title: Text(productName),
            subtitle: Text(productDes),
          )
        ]),
      ),
    );
  }
}

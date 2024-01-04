import 'package:flutter/material.dart';
import 'shopping.dart';

class MyForm extends StatelessWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test Form Input"),
      ),
      body: Container(
        child: Column(
          children: [
            MyBtn(context),
            MyBtn(context),
            MyBtn(context),
          ],
        ),
      ),
    );
  }

  Center MyBtn(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Go to Shopping"),
            Icon(Icons.add_shopping_cart_outlined),
          ],
        ),
        style: ElevatedButton.styleFrom(fixedSize:  Size(300, 200)), // Fix the style property
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return fromShopping();
              },
            ),
          );
        },
      ),
    );
  }
}

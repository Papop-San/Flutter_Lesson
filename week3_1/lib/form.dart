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
      body: Column(
        children: [
          Text("GUI INTERFACE MOBILE"),
          ElevatedButton(
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
            child: Text("Submit"),
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(300, 80),
            ),
          ),
        ],
      ),
    );
  }
}

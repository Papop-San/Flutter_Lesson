import 'package:flutter/material.dart';
import './cl_create.dart';

class Libary extends StatelessWidget {
  const Libary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Libarypage"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ), // <-- Add comma here
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Cl_create(),
                ),
              );
            },
            icon: Icon(Icons.add_circle_outline),
          )
        ],
      ),
    );
  }
}

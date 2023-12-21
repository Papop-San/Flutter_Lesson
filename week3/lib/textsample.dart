import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlue,
        body: SafeArea(
          child: Container(
            width: 300,
            height: 100,
            color: Colors.deepOrange.shade400,
            margin: EdgeInsets.all(35),
            child: Text(
              "Hello World", // Fixed the extra quote here
              style: TextStyle(
                fontSize: 50,
                color: Colors.white,
                backgroundColor: Colors.blue,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

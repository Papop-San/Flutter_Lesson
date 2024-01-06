import 'package:flutter/material.dart';

class fromResult extends StatelessWidget {
  const fromResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            ListTile(
              title: Text("Width"),
            ),
            ListTile(
              title: Text("Height"),
            ),
            ListTile(
              title: Text("Area"),
            ),
            ListTile(
              title: Text("Perimeter"),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class fromShopping extends StatelessWidget {
  const fromShopping({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Shopping Text"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: const Text("Go Back"),
        ),
      ),

    );
  }
}
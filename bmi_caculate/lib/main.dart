import 'package:flutter/material.dart';
import './Input.dart';

void main(){
  runApp(const Myapp());
}



class Myapp extends StatelessWidget {
   const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Inputfrom(),
    );
  }
}
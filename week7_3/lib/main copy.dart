import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class data{
  late int id;
  late String name;
  late DateTime t ;
  data(this.id  , this.name , this.t);
}


class _MyHomePageState extends State<MyHomePage> {
  String txt = 'N/A';
  List<data> mylist = <data>[];
  int img = 0;
  var list   = ['one' , 'two' , 'three' , 'four'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      
      body: SingleChildScrollView(
        child: Column(children: [
          Row(
            children: [
              Radio(value: 1, groupValue: img, onChanged: (int? value){
                setState(() {
                  img =1;
                });
              })
            
            ],
          ),
        ]),
      ),
      
    );
  }
}
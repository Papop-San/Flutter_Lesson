import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TEST TEST',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text(widget.title),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Row( 
                children: [
                  Radio(value: 1, groupValue: img, onChanged: (int? value){
                setState(() {
                  img =1;
                });
              }),
              Radio(value: 2, groupValue: img, onChanged: (int? value){
                setState(() {
                  img =2;
                });
              }),
             Text("test"),
                  
                ],
              
            ),
          ],
        ),
      ),
      
    );
  }
}

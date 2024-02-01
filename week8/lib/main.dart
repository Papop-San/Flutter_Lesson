import 'package:flutter/material.dart';
import './home.dart';
import './feed.dart';
import './discover.dart';
import './libary.dart';
import './activiry.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Demo",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'Add item'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required String title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final tabs = [
    Home(),
    Discovery(),
    Libary(),
    Feed(),
    ActivatyPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.shifting,
        iconSize: 35,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_pin),
              label: 'Discover',
              backgroundColor: Colors.green),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books),
              label: 'Libary',
              backgroundColor: Colors.orange),
          BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Feed',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Activity',
              backgroundColor: Colors.deepPurpleAccent),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

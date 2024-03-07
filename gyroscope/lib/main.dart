import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double x = 0, y = 0, z = 0;
  double maxX = 0, maxY = 0, maxZ = 0;
  double minX = 0, minY = 0, minZ = 0;
  String direction = "none";

  @override
  void initState() {
    gyroscopeEvents.listen((GyroscopeEvent event) {
      print(event);
      setState(() {
        x = event.x;
        y = event.y;
        z = event.z;

        // Update maximum and minimum values
        if (x > maxX) {
          maxX = x;
        } else if (x < minX) {
          minX = x;
        }

        if (y > maxY) {
          maxY = y;
        } else if (y < minY) {
          minY = y;
        }

        if (z > maxZ) {
          maxZ = z;
        } else if (z < minZ) {
          minZ = z;
        }

        // Rough calculation for direction
        if (x > 0) {
          direction = "back";
        } else if (x < 0) {
          direction = "forward";
        } else if (y > 0) {
          direction = "left";
        } else if (y < 0) {
          direction = "right";
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gyroscope Sensor in Flutter"),
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Event:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Direction: $direction",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              "X: $x",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Y: $y",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Z: $z",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              "Max X: $maxX",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Min X: $minX",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Max Y: $maxY",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Min Y: $minY",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Max Z: $maxZ",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Min Z: $minZ",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

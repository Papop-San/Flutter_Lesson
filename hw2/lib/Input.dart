import 'package:flutter/material.dart';
import './result.dart';

class Inputfrom extends StatefulWidget {
  const Inputfrom({super.key});

  @override
  State<Inputfrom> createState() => _InputfromState();
}

class _InputfromState extends State<Inputfrom> {
  String selectedShape = 'Square'; // Default selection for the shape

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculating the area",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF43766C),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: [
            // Dropdown Menu
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: DropdownButton<String>(
                value: selectedShape,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedShape = newValue!;
                  });
                },
                items: <String>['Square', 'Circle'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),

            // Width
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText:
                      "${selectedShape == 'Square' ? 'Width' : 'Radius'}",
                  prefixIcon: Icon(selectedShape == 'Square'
                      ? Icons.width_normal_outlined
                      : Icons.circle_sharp),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF5F8670)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF5F8670)),
                  ),
                ),
              ),
            ),

            // Height
            if (selectedShape == 'Square')
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Height',
                    prefixIcon: Icon(Icons.height),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF5F8670)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF5F8670)),
                    ),
                  ),
                ),
              ),

            myBtn(context),
          ],
        ),
      ),
    );
  }

  Center myBtn(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.calculate_outlined),
            Text(
              "Calculate",
              textAlign: TextAlign.center, // Optional
            )
          ],
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return fromResult();
            }),
          );
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(20.0),
          fixedSize: Size(200, 70),
          textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          primary: Color(0xFF43766C),
          onPrimary: Colors.white,
          elevation: 15,
          shadowColor: Color(0xFF43766C),
          alignment: Alignment.center, // Center button content vertically
          shape: StadiumBorder(),
        ),
      ),
    );
  }
}

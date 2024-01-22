import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:my_new_app/result.dart';

class Myfrom extends StatefulWidget {
  const Myfrom({Key? key}) : super(key: key);

  @override
  _MyfromState createState() => _MyfromState();
}

class _MyfromState extends State<Myfrom> {
  DateTime? _selectedDate;
  TextEditingController _dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _dateController.text =
        DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculate BMI",
          style: TextStyle(color: Color(0XFFFFFFEC)),
        ),
        backgroundColor: Color(0XFF40A2D8),
      ),
      body: Container(
        alignment: Alignment.center,
        child: ListView(
          children: [
            // Input from Text
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                // Controller setup
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Text Testing",
                  prefixIcon: Icon(Icons.access_alarm),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0XFF40A2D80)),
                  ),
                ),
              ),
            ),

            // Input Int
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                // Controller setup
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                ],
                decoration: InputDecoration(
                  labelText: "Input Number",
                  prefixIcon: Icon(Icons.format_list_numbered_sharp),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0XFF40A2D80)),
                  ),
                ),
              ),
            ),

            // Input Date with Date Picker
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                keyboardType: TextInputType.datetime,
                readOnly: true,
                onTap: () => _selectDate(context),
                decoration: InputDecoration(
                  labelText: "Input Date Time",
                  prefixIcon: Icon(Icons.date_range), // Date picker icon
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0XFF40A2D80)),
                  ),
                ),
                controller: _dateController,
              ),
            ),

            Mybtn(context),
          ],
        ),
      ),
    );
  }

  // Function of Date Selector
  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          DateTime.now().hour,
          DateTime.now().minute,
        );
        _dateController.text =
            DateFormat('yyyy-MM-dd HH:mm').format(_selectedDate!);
      });
    }
  }

  Center Mybtn(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Resultfrom();
          }));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.calculate_outlined),
            Text(
              "Calculate",
              textAlign: TextAlign.center,
            )
          ],
        ),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(20.0),
          fixedSize: Size(200, 70),
          textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          primary: Color(0XFF40A2D8),
          onPrimary: Colors.white,
          elevation: 15,
          shadowColor: Color(0XFF40A2D8),
          alignment: Alignment.center, // Center button content vertically
          shape: StadiumBorder(),
        ),
      ),
    );
  }
}

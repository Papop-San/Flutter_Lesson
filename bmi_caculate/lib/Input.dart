// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './show.dart';

class Inputfrom extends StatefulWidget {
  const Inputfrom({Key? key});

  @override
  State<Inputfrom> createState() => _InputfromState();
}

class _InputfromState extends State<Inputfrom> {
  String selectGender = "Male";
  late double _age;
  late double _height;
  late double _weight;
  
  final _ageController = TextEditingController();
  final _weightController =  TextEditingController();
  final _heightController = TextEditingController();


  void initState(){
    super.initState();
    _ageController.addListener(_updateText);
    _weightController.addListener(_updateText);
    _heightController.addListener(_updateText);
  }

  void _updateText(){
    _age = double.tryParse(_ageController.text)??0;
    _height= double.tryParse(_heightController.text)??0;
    _weight = double.tryParse(_weightController.text)??0;
  
  }





 
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Caculate BMI",style: TextStyle(color: Colors.white),),
        backgroundColor: Color(0xFF43766C),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: [
            //Gender Select
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: DropdownButton<String>(
                value: selectGender,
                onChanged: (String? newValue){
                  setState(() {
                    selectGender = newValue!;
                  });
                },
                items: <String>['Male' ,'Female'].map((String value){
                    return DropdownMenuItem<String>(
                      value:value ,
                      child: Text(value),
                    );
                }).toList(),
              ),
            ),
            Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  selectGender == "Male"
                      ? 'assets/images/men.png'
                      : 'assets/images/women.png',
                  width: 300,
                  height: 300,
                ),
              ),
            ],
          ),
            //Age
            Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: TextFormField(
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                     FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  decoration: InputDecoration(
                    labelText: 'Age',
                    prefixIcon: Icon(Icons.watch_later_outlined),
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

            //Weight
            Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: TextFormField(
                  controller: _weightController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                     FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  decoration: InputDecoration(
                    labelText: 'Weight',
                    prefixIcon: Icon(Icons.monitor_weight_outlined),
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

            //Height
            Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: TextFormField(
                  controller: _heightController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                     FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
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



           //Button
            newMethod(context)
          ],
        ),
      ),
    );
  }





  Center newMethod(BuildContext context) {
    return Center(
    child: ElevatedButton(
      onPressed: () {  
        Navigator.push(context,
        
          MaterialPageRoute(builder:(context){
           if(selectGender == "Male"){
            return Showresult(
              ageResult:_age,
              heightResult:_height,
              weightResult:_weight,
              genderResult: selectGender,
            );
          }
          else{
            return Showresult(
              ageResult:_age,
              heightResult:_height,
              weightResult:_weight,
              genderResult: selectGender,
            );
          }
          })
        );
      },
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

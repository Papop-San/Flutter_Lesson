import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import './result.dart';

class Myfrom extends StatefulWidget {
  const Myfrom({Key? key}) : super(key: key);

  @override
  _MyfromState createState() => _MyfromState();
}

class _MyfromState extends State<Myfrom> {
  DateTime? _selectedDate;
  TextEditingController _dateController = TextEditingController();
  var selectLearning = 'ม.6';
  String choice1 = 'สาขาวิชาเทคโนโลยีสารสนเทศ (IT)';
  String choice2 = 'สาขาวิชาอุตสาหกรรมและการจัดการ (IEM)';
  String choice3 = 'สาขาวิชาวิศวกรรมการเกษตรและอาหาร (AFE)';
  String choice4 = 'สาขาวิชาเทคโนโลยีสารสนเทศ (ITI)';
  String choice5 = 'สาขาวิชาอุตสาหกรรมและการจัดการ (IMT)';
  String choice6 = 'สาขาวิชาวิศวกรรมการเกษตรและอาหาร (AFET)';

  var _Username;
  var _Password;
  var _Fullname;
  late double _GPX;
  var _Time;

  final _selection = TextEditingController();
  final _ch1 = TextEditingController();
  final _ch2 = TextEditingController();
  final _ch3 = TextEditingController();
  final _ch4 = TextEditingController();
  final _ch5 = TextEditingController();
  final _ch6 = TextEditingController();
  final _TimeControl = TextEditingController();
  final _UsernamControl = TextEditingController();
  final _PasswordControl = TextEditingController();
  final _FullnaControl = TextEditingController();
  final _GPXControl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _dateController.text =
        DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now());
    _selection.addListener(_updateText);
    _ch1.addListener(_updateText);
    _ch2.addListener(_updateText);
    _ch3.addListener(_updateText);
    _ch4.addListener(_updateText);
    _ch5.addListener(_updateText);
    _ch6.addListener(_updateText);
    _UsernamControl.addListener(_updateText);
    _PasswordControl.addListener(_updateText);
    _FullnaControl.addListener(_updateText);
    _GPXControl.addListener(_updateText);
    _TimeControl.addListener(_updateText);
  }

  void _updateText() {
    void _updateText() {
      selectLearning = _selection.text;
      choice1 = _ch1.text;
      choice2 = _ch2.text;
      choice3 = _ch3.text;
      choice4 = _ch4.text;
      choice5 = _ch5.text;
      choice6 = _ch6.text;
      _Username = _UsernamControl.text;
      _Password = _PasswordControl.text;
      _Fullname = _FullnaControl.text;
      _GPX = double.tryParse(_GPXControl.text) ?? 0;
      _Time = _dateController.text =
          DateFormat('yyyy-MM-dd').format(_selectedDate!);
    }

    _Username = _UsernamControl.text;
    ;
    _Password = _PasswordControl.text;
    ;
    _Fullname = _FullnaControl.text;
    ;
    _GPX = double.tryParse(_GPXControl.text) ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "สมัครเรียนในคณะ FITM",
          style: TextStyle(color: Color(0XFFFFFFEC)),
        ),
        backgroundColor: Color(0XFF40A2D8),
      ),
      body: Container(
        alignment: Alignment.center,
        child: ListView(
          children: [
            //Username
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                // Controller setup
                controller: _UsernamControl,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Username",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0XFF40A2D80)),
                  ),
                ),
              ),
            ),
            //Password
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                // Controller setup
                controller: _PasswordControl,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0XFF40A2D80)),
                  ),
                ),
              ),
            ),

            // Name
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                // Controller setup
                controller: _FullnaControl,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "ชื่อ-นามสกุล",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0XFF40A2D80)),
                  ),
                ),
              ),
            ),

            //GPX
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                // Controller setup
                controller: _GPXControl,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
                ],
                decoration: InputDecoration(
                  labelText: "เกรดเฉลี่ย",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0XFF40A2D80)),
                  ),
                ),
              ),
            ),

            // Date
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: _dateController,
                keyboardType: TextInputType.datetime,
                readOnly: true,
                onTap: () => _selectDate(context),
                decoration: InputDecoration(
                  labelText: "วัน/เดือน/ปี",
                  prefixIcon: Icon(Icons.date_range), // Date picker icon
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0XFF40A2D80)),
                  ),
                ),
              ),
            ),

            //DropDown Select
            Padding(
              padding: const EdgeInsets.only(left: 40, bottom: 10),
              child: DropdownButton<String>(
                value: selectLearning,
                onChanged: (String? newValue) {
                  setState(() {
                    selectLearning = newValue!;
                  });
                },
                items: <String>['ม.6', 'ปวช'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            if (selectLearning == 'ม.6')
              //Choice 1
              Padding(
                padding: const EdgeInsets.only(left: 40, bottom: 10),
                child: DropdownButton<String>(
                  value: choice1,
                  onChanged: (String? newValue) {
                    setState(() {
                      choice1 = newValue!;
                    });
                  },
                  items: <String>[
                    'สาขาวิชาเทคโนโลยีสารสนเทศ (IT)',
                    'สาขาวิชาสารสนเทศและเครื่อช่าย (INE)',
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            if (selectLearning == 'ม.6')
              //Choice2
              Padding(
                padding: const EdgeInsets.only(left: 40, bottom: 10),
                child: DropdownButton<String>(
                  value: choice2,
                  onChanged: (String? newValue) {
                    setState(() {
                      choice2 = newValue!;
                    });
                  },
                  items: <String>[
                    'สาขาวิชาอุตสาหกรรมและการจัดการ (IEM)',
                    'สาขาวิชาเทคโนโลยีเครื่องกลและกระบวนการผลิต (MM)',
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            // //Choice 3
            if (selectLearning == 'ม.6')
              Padding(
                padding: const EdgeInsets.only(left: 40, bottom: 10),
                child: DropdownButton<String>(
                  value: choice3,
                  onChanged: (String? newValue) {
                    setState(() {
                      choice3 = newValue!;
                    });
                  },
                  items: <String>[
                    'สาขาวิชาวิศวกรรมการเกษตรและอาหาร (AFE)',
                    'สาขาวิชาคอมพิวเตอร์ช่วยออกแบบและบริารงานก่อสร้าง (CA)',
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),

            if (selectLearning == 'ปวช')
              //Choice 1
              Padding(
                padding: const EdgeInsets.only(left: 40, bottom: 10),
                child: DropdownButton<String>(
                  value: choice4,
                  onChanged: (String? newValue) {
                    setState(() {
                      choice4 = newValue!;
                    });
                  },
                  items: <String>[
                    'สาขาวิชาเทคโนโลยีสารสนเทศ (ITI)',
                    'สาขาวิชาสารสนเทศและเครื่อช่าย (INET)',
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            if (selectLearning == 'ปวช')
              //Choice2
              Padding(
                padding: const EdgeInsets.only(left: 40, bottom: 10),
                child: DropdownButton<String>(
                  value: choice5,
                  onChanged: (String? newValue) {
                    setState(() {
                      choice5 = newValue!;
                    });
                  },
                  items: <String>[
                    'สาขาวิชาอุตสาหกรรมและการจัดการ (IMT)',
                    'สาขาวิชาเทคโนโลยีเครื่องกลและกระบวนการผลิต (MMT)',
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            // //Choice 3
            if (selectLearning == 'ปวช')
              Padding(
                padding: const EdgeInsets.only(left: 40, bottom: 10),
                child: DropdownButton<String>(
                  value: choice6,
                  onChanged: (String? newValue) {
                    setState(() {
                      choice6 = newValue!;
                    });
                  },
                  items: <String>[
                    'สาขาวิชาวิศวกรรมการเกษตรและอาหาร (AFET)',
                    'สาขาวิชาคอมพิวเตอร์ช่วยออกแบบและบริารงานก่อสร้าง (CDM)',
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
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
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                if (selectLearning == 'ม.6') {
                  return Resultfrom(
                    UsernameResult: _Username,
                    PasswordResult: _Password,
                    FullnameResult: _Fullname,
                    GPXResult: _GPX,
                    Ch1Result: choice1,
                    Ch2Result: choice2,
                    Ch3Result: choice3,
                    SelectionResult: selectLearning,
                    // TimeResult: _Time,
                  );
                } else {
                  return Resultfrom(
                    UsernameResult: _Username,
                    PasswordResult: _Password,
                    FullnameResult: _Fullname,
                    GPXResult: _GPX,
                    Ch1Result: choice4,
                    Ch2Result: choice5,
                    Ch3Result: choice6,
                    // TimeResult: _Time,

                    SelectionResult: selectLearning, // Corrected variable name
                  );
                }
              },
            ),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.calculate_outlined),
            Text(
              "สรุปผลการสมัคร",
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

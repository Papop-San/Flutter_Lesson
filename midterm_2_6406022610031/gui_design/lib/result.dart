import 'package:flutter/material.dart';

class Resultfrom extends StatelessWidget {
  final String UsernameResult;
  final String PasswordResult;
  final String FullnameResult;
  final double GPXResult;
  final String Ch1Result;
  final String Ch2Result;
  final String Ch3Result;
  final String SelectionResult;

  Resultfrom({
    Key? key,
    required this.UsernameResult,
    required this.PasswordResult,
    required this.FullnameResult,
    required this.GPXResult,
    required this.Ch1Result,
    required this.Ch2Result,
    required this.Ch3Result,
    required this.SelectionResult,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "สรุปข้อมูลของการสมัคร",
        ),
        backgroundColor: Color(0XFF40A2D8),
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            ListTile(
              title: Text(
                "Username: $UsernameResult",
              ),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            ListTile(
              title: Text("Password: $PasswordResult"),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            ListTile(
              title: Text("ชื่อ-นามสกุล: $FullnameResult"),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            // ListTile(
            //   title: Text("วัน/เดือน/ปี: $TimeResult"),
            // ),
            ListTile(
              title: Text("เกรดเฉลี่ย: $GPXResult"),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            ListTile(
              title: Text("อันดับที่1: $Ch1Result"),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            ListTile(
              title: Text("อันดับที่2: $Ch2Result"),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            ListTile(
              title: Text("อันดับที่3: $Ch3Result"),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

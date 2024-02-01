import 'package:flutter/material.dart';

class Cl_create extends StatefulWidget {
  const Cl_create({Key? key}) : super(key: key);

  @override
  State<Cl_create> createState() => _Cl_createState();
}

class _Cl_createState extends State<Cl_create> {
  var yourName = TextEditingController();
  var surName = TextEditingController();
  var yourUni = TextEditingController();
  var yourFaculty = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Create Form"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                PictureIcon(),
                TextHeader('General Info'),
                textFormF('Your Name', 'Input Your Name', yourName),
                textFormF(
                    'Surname', 'Surname', surName), // Fixed typo in 'Surname'
                TextHeader('Education Info'),
                textFormF('Your University', 'Input Your University', yourUni),
                textFormF('Faculty', 'Input Faculty', yourFaculty),
                SizedBox(
                  height: 60, // Adjusted height for the SizedBox
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue, // background color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                30), // rounded corner radius
                          ),
                        ),
                        onPressed: () {
                          print('Your Name' + yourName.text);
                          print('Your SureName' + surName.text);
                          print('Your University' + yourUni.text);
                          print('Your Faculty' + yourFaculty.text);
                        },
                        child: Text(
                          'Add Data',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      SizedBox(width: 16), // Add spacing between buttons
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red, // background color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                30), // rounded corner radius
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Cancel',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField textFormF(
      String lText, String hText, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: lText,
        hintText: hText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  Text TextHeader(String lText) {
    return Text(
      lText,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.blue,
      ),
    );
  }

  Padding PictureIcon() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Icon(
        Icons.insert_photo,
        size: 100,
      ),
    );
  }
}

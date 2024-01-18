import 'package:flutter/material.dart';
import './shopping.dart';

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  var _productName;
  var _userName;
  bool _checkBox = false;
  bool _listTitleCheckBox = false;

  final _userNameController = TextEditingController();
  final _productNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _userNameController.addListener(_updateText);
    _productNameController.addListener(_updateText);
  }

  void _updateText() {
    setState(() {
      _productName = _productNameController.text;
      _userName = _userNameController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test Form Input"),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: [
            TextField(
              controller: _userNameController,
              decoration: InputDecoration(
                hintText: "Product Name",
                icon: Icon(Icons.verified_user_outlined),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _productNameController,
              decoration: InputDecoration(
                labelText: "Product Description",
                icon: Icon(Icons.verified_user_outlined),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

            //Radio  Type


            //Radio Type
            Radio(value: null, groupValue: null, onChanged: null),
            RadioListTile(value: null, groupValue: null, onChanged: null),

            SizedBox(height: 20.0,),
            MyBtn(context),
            SizedBox(height: 40.0,),



            
            Text(
              "Username is : $_userName",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            Text(
              "The product name is : $_productName",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }

  Center MyBtn(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Go to Shopping"),
            Icon(Icons.add_shopping_cart_outlined),
          ],
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return FromShopping(
                  productName: _productName,
                  productDes: _userName,
                );
              },
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(20.0),
          fixedSize: Size(300, 80),
          textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          primary: Colors.blueAccent,
          onPrimary: Colors.white,
          elevation: 15,
          shadowColor: Colors.blueAccent,
          alignment: Alignment.topLeft,
          shape: StadiumBorder(),
        ),
      ),
    );
  }
}
class MyTextField extends StatelessWidget {
  const MyTextField({
    Key? key,
    required this.fieldName,
    required this.myController,
    this.myIcon = Icons.verified_user_outlined,
    this.prefixIconColor = Colors.blueAccent,
  }) : super(key: key);

  final TextEditingController myController;
  final String fieldName;
  final IconData myIcon; 
  final Color prefixIconColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      decoration: InputDecoration(
        labelText: fieldName, 
        prefixIcon: Icon(
          myIcon,
          color: prefixIconColor,
        ),
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple),
        ),
      ),
    );
  }
}

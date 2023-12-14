import 'package:flutter/material.dart';
import 'foodMenu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int number = 0;
  int totalPrice = 0;
  List<foodMenu> menu = [
    foodMenu("ผัดกะเพรากุ้ง", "60", "assets/images/1.jpg"),
    foodMenu("ผัดกะเพรากหมู", "40", "assets/images/2.jpg"),
    foodMenu("ไข่เจียวพักโขม", "35", "assets/images/5.jpg"),
    foodMenu("กะเพราหมูหมัก", "50", "assets/images/3.jpg"),
    foodMenu("ไข่ดาว", "10", "assets/images/4.jpg"),
    foodMenu("น้ำตกหมู", "70", "assets/images/7.png"),
    foodMenu("ต้มยำกุ้ง", '120', "assets/images/8.jpg"),
    foodMenu("หน่อไม้ทอด", "40","assets/images/9.jpg"),
    foodMenu("เกาหลา", "60", "assets/images/10.jpg")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Food Menu',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: menu.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Image.asset(
              menu[index].img,
              width: 200,
              fit: BoxFit.cover,
            ),
            title: Text(
              
              '${index + 1}. ${menu[index].name}', // Add the index for the loop on food names
              style: TextStyle(fontSize: 18, color: Colors.red),
            ),
            subtitle: Text(
              'Price: ${menu[index].price} Baht',
              style: TextStyle(fontSize: 14, color: Colors.blue),
            ),
            
             
            onTap: () {
              setState(() {
                number++;
                totalPrice +=  int.parse(menu[index].price);
              });

              AlertDialog alert = AlertDialog(
                
                title: Text("คุณเลือกซื้อาหารไปทั้งหมด ${number.toString()}  ราคารวมทั้งหมดก็คือ ${totalPrice.toString()}" , style: TextStyle(fontSize: 18 , color: Colors.blue),),
              );
            
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return alert;
                },
              );
            }
           
          );
        },
      ),
    );
  }
}

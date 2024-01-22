import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: const MyHomePage(title: 'List Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class data {
  late int id;
  late String name;
  late DateTime t;
  data(this.id, this.name, this.t);
}

class _MyHomePageState extends State<MyHomePage> {
  String txt = 'N/A';
  List<data> mylist = <data>[];
  int img = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Radio(
                  value: 1,
                  groupValue: img,
                  onChanged: (int? value) {
                    setState(() {
                      img = 1;
                    });
                  },
                ),
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/images/ig.png'),
                ),
                Radio(
                  value: 2,
                  groupValue: img,
                  onChanged: (int? value) {
                    setState(() {
                      img = 2;
                    });
                  },
                ),
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/images/line.png'),
                ),
                Radio(
                  value: 3,
                  groupValue: img,
                  onChanged: (int? value) {
                    setState(() {
                      img = 3;
                    });
                  },
                ),
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/images/avenger.png'),
                ),
                Radio(
                  value: 4,
                  groupValue: img,
                  onChanged: (int? value) {
                    setState(() {
                      img = 4;
                    });
                  },
                ),
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/images/rocket.png'),
                ),
              ],
            ),
            SizedBox(height: 20),
            const TextField(),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  txt = "Add item success";
                  mylist.add(data(img, '1', DateTime.now()));
                });
              },
              child: const Text('Add Item'),
            ),
            Text(
              txt,
              textScaleFactor: 2,
            ),
            SizedBox(
              width: double.infinity,
              height: 550,
              child: ListView.builder(
                itemCount: mylist.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: double.infinity,
                    height: 80,
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      color: Colors.primaries[index % Colors.primaries.length],
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage('assets/images/${getImageFileName(mylist[index].id)}.png'),
                        ),
                        title: Text('Title Text (${mylist[index].id})'),
                        subtitle: Text(mylist[index].t.toString()),
                        trailing: const Icon(Icons.delete_rounded),
                        onTap: () {
                          setState(() {
                            txt = 'Title Text ($index) is removed';
                            mylist.removeAt(index);
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getImageFileName(int imageId) {
    switch (imageId) {
      case 1:
        return 'ig';
      case 2:
        return 'line';
      case 3:
        return 'avenger';
      case 4:
        return 'rocket';
      default:
        return '';
    }
  }
}

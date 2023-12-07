import 'package:flutter/material.dart';

void main() {
 
  runApp(Myapp());
}



class Myapp extends StatelessWidget{
  const Myapp({Key? key}): super(key:key);


  @override
  Widget build(BuildContext context){
    return MaterialApp(
    title: "Myapp",
    home: Scaffold(
      appBar: AppBar(
        title: Text("Papop Sangeamsak"),
        // Set the background color explicitly
        backgroundColor: Colors.cyan, 
      ),
     body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            Image.network("https://cdn.vox-cdn.com/uploads/chorus_asset/file/22312759/rickroll_4k.jpg"
            // ,width: 100,
            // height: 100,
            ),
            SizedBox(height: 16),
            Text(
                "Nerver Give You UP!!",
                style: TextStyle(fontSize: 24, color: Colors.red),
              ),
            Text(
              "Nerver Gone You Down",
              style: TextStyle(fontSize: 24, color: Colors.red),
            ),
        ],
      ),
       ),
    ),
    theme: ThemeData(primarySwatch: Colors.cyan),
  );

  }

}
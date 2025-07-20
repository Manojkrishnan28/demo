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
    home: Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("INSTARGRAM",style: TextStyle(fontSize: 60,color: Colors.black,),
        ),
        actions: [
          Icon(Icons.search),Icon(Icons.more_vert)
        ],
        
      ),
      body: Center(
        child: ElevatedButton(onPressed: (){}, 
        child: Text("submit",style: TextStyle(fontSize: 40,color: Colors.blue),)),
      ),
    ),
    );
  }
}


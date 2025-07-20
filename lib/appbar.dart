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
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.message),

          backgroundColor: Colors.blueGrey,
          elevation: 80,
        ),

        drawer: Drawer(),
        appBar: AppBar(
          backgroundColor: Colors.pink,
          elevation: 30,
          title: Text("My frist flutter app"),
          actions: [Icon(Icons.search), Icon(Icons.more_vert)],
        ),

        body: Center(
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              "sumbit ",
              style: TextStyle(fontSize: 80, color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}

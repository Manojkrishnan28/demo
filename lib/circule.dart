import 'package:flutter/material.dart';

void main()
{
  runApp(const MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.blue,
            backgroundColor: Colors.black,
            value: 6.5,
            strokeWidth: 10,
            
          ),
          
          
        ),
      ),
      
    );
  }
}
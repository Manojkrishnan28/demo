import 'package:flutter/material.dart';

void main()
{
  runApp(const Manoj());
}
class Manoj extends StatelessWidget {
  const Manoj({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: CircleAvatar(
            backgroundColor: Colors.red,
            radius:650 ,
            child: CircleAvatar(  
              backgroundColor: Colors.black87,
              radius: 600,
              backgroundImage: NetworkImage("https://i1.sndcdn.com/artworks-NzTguKWLAoQbwSbg-oHCcHg-t500x500.jpg"),
            
            ),
          ),
        ),

      ),
      
    );
  }
}

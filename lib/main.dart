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
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        
        body: Center(
          child: Container( 
            width:400,
            height: 400,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage("https://imgd.aeplcdn.com/664x374/cw/ec/23766/Ford-Mustang-Left-Front-Three-Quarter-74324.jpg?v=201711021421&q=80"
                
                ),
                fit: BoxFit.cover
              ) ,
              boxShadow: [
                BoxShadow(
                  color:Colors.red,
                  offset: Offset(4.5, 6.6),
                  blurRadius: 6.0,


                )
              ]

            ),

          ),
        ),
      )
      
    );
  }
}
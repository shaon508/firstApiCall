import 'package:flutter/material.dart';
import 'homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //
      //Here, the home page is called, and the main UI color is defined.
      //
      title: 'Flutter Demo',
      theme: ThemeData(
         primaryColor: Colors.white60,
      ),

      home:  HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}




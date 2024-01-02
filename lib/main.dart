import 'package:flutter/material.dart';
import 'package:travel_app/Screens/Home/Home.dart';
import 'package:travel_app/Screens/Hotels/Hotels.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
       appBarTheme: AppBarTheme(
         iconTheme: IconThemeData(color: Colors.black)
       ),
      ),
      debugShowCheckedModeBanner: false,
      home: Home()
    );
  }
}


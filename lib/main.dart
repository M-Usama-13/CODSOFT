import 'package:flutter/material.dart';
import 'package:to_do_list/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
    Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'OoohBaby',
        textTheme:
        const TextTheme(
          headline1: TextStyle(color: Colors.white),
          headline2: TextStyle(color: Colors.white60),
          bodyText2: TextStyle(color: Colors.white),
          subtitle1: TextStyle(color: Colors.white70),
        ),
      ),
    );
  }
  }
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Image listing',
      theme: ThemeData(
        primaryColor: HexColor('#37a8ec'),
        scaffoldBackgroundColor: HexColor('#e2e2e2'),
      ),
      home: ShowDataScreen(),
    );
  }
}
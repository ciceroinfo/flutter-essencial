import 'package:aula01_app/home_page.dart';
import 'package:aula01_app/utils/util.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: colorConvert("#99000f"),
      ),
      home: HomePage(),
    );
  }
}

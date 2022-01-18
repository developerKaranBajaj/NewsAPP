import 'package:flutter/material.dart';
import 'package:newsapp/theme/material_white.dart';
import 'package:newsapp/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        primarySwatch: ColorData.white,
      ),
      home: const Home(),
    );
  }
}

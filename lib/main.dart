import 'package:flutter/material.dart';
import 'package:find_my_college/pages/page1.dart';
import 'package:find_my_college/constants.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: peach),
        useMaterial3: true,
      ),
      home: inputScreen(),
    );
  }
}

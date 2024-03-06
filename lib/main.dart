import 'package:flutter/material.dart';

import 'SharedPreferenceDemo.dart';

void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "SharedPreferenceDemo",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),),
      home: SharedPreferenceDemo(),
    );
  }

}
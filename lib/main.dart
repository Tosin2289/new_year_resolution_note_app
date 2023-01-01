import 'package:flutter/material.dart';
import 'package:new_year_resolution/splash.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  //initalise flutter
  await Hive.initFlutter();
//open a box
  var box = await Hive.openBox('mybox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Splash(),
    );
  }
}

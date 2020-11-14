import 'package:flutter/material.dart';
import 'package:wpmustafa/BottomNav/UserBottomNavigator.dart';

import 'Home/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Home5(),
    );
  }
}
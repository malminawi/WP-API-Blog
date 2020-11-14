import 'package:flutter/material.dart';
import 'package:wpmustafa/Home/home.dart';
import 'package:wpmustafa/games/quizGame.dart';

class mainScreen extends StatefulWidget {
  @override
  _mainScreenState createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  List<Widget> myPages = [Home(), QuizPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: PageView.builder(

        itemCount: myPages.length,

        itemBuilder: (context, position) => myPages[position],

      ),

    );
  }
}
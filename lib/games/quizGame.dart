import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_background/animated_background.dart';
//import 'package:flutter/rendering.dart';
import 'package:getflutter/getflutter.dart';

QuizLogic quizLogic = QuizLogic();
class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {


  final List<Widget> scoreKeeper = [];

  int totalCorrect = 0;
  int totalQuestions = 0;

  void checkAnswer(bool value) {
    if (quizLogic.getAnswer() == value) {
      _congrats(context);
      print('right answer');
      scoreKeeper.add(Icon(Icons.check_circle, color: Colors.green));
      totalCorrect ++;
    } else {
      _NotRight(context);
      print('wrong answer');
      scoreKeeper.add(Icon(Icons.close, color: Colors.red));
    }
    totalQuestions++;
    if (quizLogic.isFinshed() == true) {
      Alert(
          context: context,
          title: 'Finished',
          desc: 'You scored a total of $totalCorrect out of $totalQuestions!',
          buttons: [
            DialogButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Play Again',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                )
            ),
            DialogButton(
                onPressed: () {
                  showModalBottomSheet(context: context,
                      builder: (context){
                        return SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                title: Text('1. 70 = 7 tens. Thus, 5 X 70 = 5 X 7 tens. The correct answer is 35 tens. "TRUE"\n',style: TextStyle(
                                  color: Colors.green,
                                  fontFamily: 'Montserrat',
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none,
                                ),),

                              ),
                              ListTile(
                                title: Text('2. 7 X 3,000 = 21,000. The correct answer is FALSE\n',style: TextStyle(
                                  color: Colors.green,
                                  fontFamily: 'Montserrat',
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none,
                                ),),

                              ),
                              ListTile(
                                title: Text('3. The correct answer is TRUE\n',style: TextStyle(
                                  color: Colors.green,
                                  fontFamily: 'Montserrat',
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none,
                                ),),
                              ),
                              ListTile(
                                title: Text('4. The correct answer is FALSE\n',style: TextStyle(
                                  color: Colors.green,
                                  fontFamily: 'Montserrat',
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none,
                                ),),
                              ),

                              ListTile(
                                title: Text('5. The correct answer is Hello. "FALSE"\n',style: TextStyle(
                                  color: Colors.green,
                                  fontFamily: 'Montserrat',
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none,
                                ),),

                              ),

                              ListTile(
                                title: Text('6. The correct answer is Pacific Ocean. "FALSE"\n',style: TextStyle(
                                  color: Colors.green,
                                  fontFamily: 'Montserrat',
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none,
                                ),),
                              ),
                              ListTile(
                                title: Text('7. The correct answer is TRUE\n',style: TextStyle(
                                  color: Colors.green,
                                  fontFamily: 'Montserrat',
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none,
                                ),),
                              ),
                              ListTile(
                                title: Text('8. The correct answer is Fish. "FALSE"\n',style: TextStyle(
                                  color: Colors.green,
                                  fontFamily: 'Montserrat',
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none,
                                ),),
                              ),
                              ListTile(
                                title: Text('9. The correct answer TRUE\n',style: TextStyle(
                                  color: Colors.green,
                                  fontFamily: 'Montserrat',
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none,
                                ),),
                              ),
                              ListTile(
                                title: Text('10. The correct answer is TRUE\n',style: TextStyle(
                                  color: Colors.green,
                                  fontFamily: 'Montserrat',
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none,
                                ),),
                              ),

                              ListTile(
                                title: Text('11. The correct answer is Protein. "FALSE"\n',style: TextStyle(
                                  color: Colors.green,
                                  fontFamily: 'Montserrat',
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none,
                                ),),
                              ),
                              ListTile(
                                title: Text('12. The correct answer is Weight Gain. "FALSE"\n',style: TextStyle(
                                  color: Colors.green,
                                  fontFamily: 'Montserrat',
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none,
                                ),),
                              ),
                              ListTile(
                                title: Text('13. The correct answer is TRUE\n',style: TextStyle(
                                  color: Colors.green,
                                  fontFamily: 'Montserrat',
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none,
                                ),),
                              ),
                              ListTile(
                                title: Text('14. The correct answer is TRUE\n',style: TextStyle(
                                  color: Colors.green,
                                  fontFamily: 'Montserrat',
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none,
                                ),),
                              ),

                            ],
                          ),
                        );
                      }
                  );
                },
                child: Text(
                  'See answers',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                )
            )

          ]
      ).show();
      quizLogic.reset();
      scoreKeeper.clear();
      totalCorrect = 0;
      totalQuestions = 0;
    } else {
      quizLogic.nextQuestion();
    }

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        leading: new IconButton(icon: new Icon(Icons.arrow_back_ios),
//            color: Colors.black,
//            onPressed: () => Navigator.of(context).pop()
//        ),
//        elevation: 0.0,
//        centerTitle: true,
//        backgroundColor: Colors.green[100],
//      ),
      backgroundColor: Colors.green[100],

      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("You have 15 TRUE/FALSE questions."),
            ),
            Expanded(
              child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Container(

                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Text(
                        quizLogic.getQuestion(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25.0,
                        ),
                      ),
                    ),
                  )
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 50, right: 50, bottom: 20),
                        child:  GFButton(
                          onPressed: ()  {
                                setState(() {
                            checkAnswer(true);
                         });
                          },
                          text: "TRUE", textStyle: TextStyle(fontSize: 26, color: Colors.black),
                          icon: Icon(Icons.check),
                          shape: GFButtonShape.pills,
                          color: Colors.green[200],
                        ),

                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 50, right: 50, bottom: 20),
                      child: GFButton(
                        onPressed: ()  {
                  setState(() {
                  checkAnswer(false);
                  });
                  },
                    text: "FALSE", textStyle: TextStyle(fontSize: 26, color: Colors.black),
                    icon: Icon(Icons.check),
                    shape: GFButtonShape.pills,
                    color: Colors.red[100],
                  ),
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  Expanded(child: Row(children: scoreKeeper,),)

                ],
              ),
            ),

           // Expanded(child: Row(children: scoreKeeper,),)
          ],
        ),
      ),
    );
  }
}


Future<void> _congrats(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Great work!'),
        content: const Text('Keep up the good work! '),
      );
    },
  );
}

Future<void> _NotRight(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Try Again!'),
        content: const Text('Go next...'),
      );
    },
  );
}




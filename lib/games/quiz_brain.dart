import 'question.dart';
class QuizLogic {
  int _questionNumber = 0;

  List<Question> _questions = [
    Question('1. 5 X 70= 35 tens?', true),
    Question('2. If 7 X 3 = 21 \n Is 7 X 3,000 = 21,00 ? ', false),
    Question('3. Intensity is a measure of how loud or soft a sound is.', true),
    Question('4. The eardrum vibrates back and forth to make sound.', false),
    Question('5. Hola means "Bye" in English?', false),
    Question('6. The Atlantic Ocean is the biggest ocean on Earth.', false),
    Question('7. The chemical make up food often changes when you cook it.', true),
    Question('8. Sharks are mammals', false),
    Question('9. Atoms are most stable when their outer shells are full.', true),
    Question('10. A balanced diet can include three main meals with snacks in between', true),
    Question('11. To have energy that lasts through the morning, you should always eat some fat at breakfast', false),
    Question('12. Empty-calorie foods can cause weight loss', false),
    Question('13. One way to keep vitamins and minerals in food is to store dairy foods away from light', true),
    Question('14. The Dietary Guidelines recommend that you eat a variety of grains each day', true),
  ];

  String getQuestion() {
    return _questions[_questionNumber].questionString;
  }

  bool isFinshed() {
    if (_questionNumber >= _questions.length - 1 ) {
      return true;
    } else {
      return false;
    }
  }

  int printQuestionNumber() {
    print(_questionNumber);
  }

  int printQuestionsLength() {
    print(_questions.length);
  }

  void reset() {
    _questionNumber = 0;
  }

  bool getAnswer() {
    return _questions[_questionNumber].questionAnswer;
  }

  void nextQuestion() {
    if (_questionNumber < _questions.length - 1) {
      _questionNumber++;
    }
  }

}
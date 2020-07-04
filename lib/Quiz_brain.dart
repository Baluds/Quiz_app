import 'package:quiz_master/questions.dart';

class Quizbrain {
  int _value = 0;
  int _value1 = 0;
  List<Questions> _questionbank = [
    Questions(que: 'Some cats are actually allergic to humans', ans: true),
    Questions(
        que: 'You can lead a cow down stairs but not up stairs', ans: false),
    Questions(
        que: 'Approximately one quarter of human bones are in the feet.',
        ans: true),
    Questions(que: 'A slug\'s blood is green.', ans: true),
    Questions(
        que: 'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', ans: true),
    Questions(que: 'It is illegal to pee in the Ocean in Portugal.', ans: true),
    Questions(
        que:
            'No piece of square dry paper can be folded in half more than 7 times.',
        ans: false),
    Questions(
        que:
            'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        ans: true),
    Questions(
        que:
            'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        ans: false),
    Questions(
        que:
            'The total surface area of two human lungs is approximately 70 square metres.',
        ans: true),
    Questions(que: 'Google was originally called \"Backrub\".', ans: true),
    Questions(
        que:
            'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        ans: true),
    Questions(
        que:
            'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        ans: true),
  ];

  String getquestion() {
    return _questionbank[_value].que;
  }

  bool getanswer() {
    return _questionbank[_value].ans;
  }

  void nextquestion() {
    if (_value < _questionbank.length - 1) {
      _value++;
    } else {
      _value1 = 1;
    }
  }

  bool isfinished() {
    if (_value1 == 1) {
      _value1 = 0;
      return true;
    } else {
      return false;
    }
  }

  void resetq() {
    _value = 0;
  }
}

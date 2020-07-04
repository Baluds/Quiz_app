//This is completed using only lists no classes and objects

import 'package:flutter/material.dart';
// import 'package:quiz_master/questions.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(
        //   title: Center(child: Text('Quizzler')),
        //   backgroundColor: Colors.grey,
        // ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Hpage(),
          ),
        ),
        backgroundColor: Colors.grey.shade900,
      ),
    );
  }
}

class Hpage extends StatefulWidget {
  Hpage({Key key}) : super(key: key);

  @override
  _HpageState createState() => _HpageState();
}

class _HpageState extends State<Hpage> {
  List<Icon> results = [];

  List<String> questions = [
    'Some cats are actually allergic to humans',
    'You can lead a cow down stairs but not up stairs',
    'Approximately one quarter of human bones are in the feet.',
    'A slug\'s blood is green.',
    'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".',
    'It is illegal to pee in the Ocean in Portugal.',
    'No piece of square dry paper can be folded in half more than 7 times.',
    'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
    'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
    'The total surface area of two human lungs is approximately 70 square metres.',
    'Google was originally called \"Backrub\".',
    'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
    'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.'
  ];
  List<String> answers = [
    'true',
    'false',
    'true',
    'true',
    'true',
    'true',
    'false',
    'true',
    'false',
    'true',
    'true',
    'true',
    'true'
  ];

  // List<Questions> questionbank = [
  //   Questions(q: 'Some cats are actually allergic to humans', a: true),
  //   Questions(q: 'You can lead a cow down stairs but not up stairs', a: false),
  //   Questions(
  //       q: 'Approximately one quarter of human bones are in the feet.',
  //       a: true),
  //   Questions(q: 'A slug\'s blood is green.', a: true),
  //   Questions(q: 'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', a: true),
  //   Questions(q: 'It is illegal to pee in the Ocean in Portugal.', a: true),
  //   Questions(
  //       q: 'No piece of square dry paper can be folded in half more than 7 times.',
  //       a: false),
  //   Questions(
  //       q: 'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
  //       a: true),
  //   Questions(
  //       q: 'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
  //       a: false),
  //   Questions(
  //       q: 'The total surface area of two human lungs is approximately 70 square metres.',
  //       a: true),
  //   Questions(q: 'Google was originally called \"Backrub\".', a: true),
  //   Questions(
  //       q: 'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
  //       a: true),
  //   Questions(
  //       q: 'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
  //       a: true),
  // ];

  int value = 0;
  call(int score) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Quiz is completed'),
          content: Text('Your score is $score'),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'Restart',
                style: TextStyle(color: Colors.grey.shade900),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  int score = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questions[value],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              onPressed: () {
                if (answers[value] == 'true') {
                  setState(() {
                    results.add(Icon(
                      Icons.check,
                      color: Colors.green,
                    ));
                    value++;
                    score++;
                  });
                } else {
                  setState(() {
                    results.add(Icon(
                      Icons.close,
                      color: Colors.red,
                    ));
                    value++;
                  });
                }

                if (value >= 13) {
                  setState(() {
                    call(score);
                    score = 0;
                    value = 0;
                    results.clear();
                  });
                }
              },
              child: Text(
                'True',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              color: Colors.green,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              onPressed: () {
                if (answers[value] == 'false') {
                  setState(() {
                    results.add(Icon(
                      Icons.check,
                      color: Colors.green,
                    ));
                    value++;
                    score++;
                  });
                } else {
                  setState(() {
                    results.add(Icon(
                      Icons.close,
                      color: Colors.red,
                    ));
                    value++;
                  });
                }
                if (value >= 13) {
                  setState(() {
                    call(score);
                    score = 0;
                    value = 0;
                    results.clear();
                  });
                }
              },
              child: Text(
                'False',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              color: Colors.red,
            ),
          ),
        ),
        Row(
          children: results,
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/

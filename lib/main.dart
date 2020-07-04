//This app is completed using concepts of OOP,classes and objects

import 'package:flutter/material.dart';
import 'package:quiz_master/Quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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

  void checkanswer(bool usergiven) {
    if (quizbrain.getanswer() == usergiven) {
      setState(() {
        results.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
        quizbrain.nextquestion();
        score++;
      });
    } else {
      setState(() {
        results.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
        quizbrain.nextquestion();
      });
    }

    if (quizbrain.isfinished() == true) {
      setState(() {
        call(score);
        score = 0;
        quizbrain.resetq();
        results.clear();
      });
    }
  }

  Quizbrain quizbrain = Quizbrain();

  call(int score) {
    Alert(
      context: context,
      type: AlertType.success,
      title: "Quiz is completed",
      desc: "Your score is $score",
      buttons: [
        DialogButton(
          child: Text(
            "Reset",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
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
                quizbrain.getquestion(),
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
                checkanswer(true);
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
                checkanswer(false);
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
